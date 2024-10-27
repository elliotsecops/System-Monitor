#!/usr/bin/env bash

# Default interval
INTERVAL=5
DISKS=("/")
CPU_USAGE="0%"  # Initialize CPU usage

# Loads configuration from a file.
# Args:
#   $1: The path to the configuration file.
load_config() {
    local config_file="$1"
    if [[ -f "$config_file" ]]; then
        while IFS= read -r line; do
            if [[ "$line" =~ ^([A-Za-z_]+)=([^\#]+) ]]; then
                local var="${BASH_REMATCH[1]}"
                local value="${BASH_REMATCH[2]}"
                if [[ "$var" == "DISKS" ]]; then
                    IFS=' ' read -r -a DISKS <<< "$value"
                else
                    declare -g "$var=$value"
                fi
            fi
        done < "$config_file"
        return 0  # Success
    else
        echo "Config file not found: $config_file" >&2
        return 1  # Failure
    fi
}

# Function to get CPU usage
get_cpu_usage() {
    local prev_idle=0
    local prev_total=0

    while true; do
        read -r cpu_user cpu_nice cpu_system cpu_idle iowait irq softirq steal guest guest_nice < <(grep 'cpu ' /proc/stat | awk '{print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11}')
        local idle=$((cpu_idle + iowait))
        local total=$((cpu_user + cpu_nice + cpu_system + idle + irq + softirq + steal))

        if [[ $prev_idle -gt 0 ]]; then
            local diff_idle=$((idle - prev_idle))
            local diff_total=$((total - prev_total))
            local cpu_usage=$(echo "scale=2; 100 * ($diff_total - $diff_idle) / $diff_total" | bc)
            echo "$cpu_usage%"
        fi

        prev_idle="$idle"
        prev_total="$total"
        sleep "$INTERVAL"  # Match the main loop's interval
    done
} > >(while read cpu; do
    CPU_USAGE="$cpu"
done) &

# Function to get memory usage
get_memory_usage() {
    read -r _ mem_total _ < <(grep MemTotal /proc/meminfo)
    read -r _ mem_free _ < <(grep MemFree /proc/meminfo)
    read -r _ mem_buffers _ < <(grep Buffers /proc/meminfo)
    read -r _ mem_cached _ < <(grep Cached /proc/meminfo)
    local used=$((mem_total - mem_free - mem_buffers - mem_cached))
    local percent=$((used * 100 / mem_total))
    echo "$percent%"
}

# Function to get disk usage
get_disk_usage() {
    for disk in "${DISKS[@]}"; do
        if df -h "$disk" &> /dev/null; then  # Redirect stderr to /dev/null to suppress "df: ..." messages for non-existent mount points.
            df -h "$disk" | awk 'NR==2{printf "%-15s %s\n", $NF":", $5}'
        else
            printf "%-15s %s\n" "$disk:" "Error: Not Found"
        fi
    done
}

# Main monitoring loop
main_loop() {
    while true; do
        clear
        echo "System Monitor"
        echo "CPU Usage: $CPU_USAGE"
        echo "Memory Usage: $(get_memory_usage)"
        get_disk_usage
        sleep "$INTERVAL"
    done
}

# Signal handling to gracefully exit
trap 'echo "Exiting..."; exit 0' SIGINT SIGTERM

# Display help message
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    cat << EOF
Usage: $0 [-i interval] [-d disk_mountpoint] [-c config_file] [-h|--help]

-i, --interval <seconds>  Set the refresh interval (default: $INTERVAL).
-d, --disk <mountpoint>   Add a disk mount point to monitor.
-c, --config <file>       Load configuration from a file.
-h, --help                Display this help message.
EOF
    exit 0
fi

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -i|--interval) INTERVAL="$2"; shift ;;
    -d|--disk) DISKS+=("$2"); shift ;;
    -c|--config) load_config "$2"; shift ;;
    *) echo "Unknown parameter passed: $1" >&2; exit 1 ;;
  esac
  shift
done

# Validate interval
if [[ ! "$INTERVAL" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Interval must be a positive integer." >&2
    exit 1
fi

# Validate disk mount points
for disk in "${DISKS[@]}"; do
    if [[ ! -d "$disk" ]]; then
        echo "Error: '$disk' is not a valid directory." >&2
        exit 1
    fi
done

# Load configuration, exit if it fails
if ! load_config "$config_file"; then
    exit 1
fi

# Start CPU monitoring in the background
get_cpu_usage &

# Start the main loop
main_loop
