#!/bin/bash

# Uso del cpu
get_cpu_usage() {
    mpstat 1 1 | awk '/Average:/ {printf "Uso de CPU: %.2f%%", 100 - $12}' || echo "Error obteniendo uso de CPU."
}

# Uso de la memoria
get_memory_usage() {
    free -m | awk 'NR==2{printf "Uso de Memoria: %.2f%%\t%sMB usados de %sMB", $3*100/$2, $3, $2 }' || echo "Error obteniendo uso de memoria."
}

# Uso del disco
get_disk_usage() {
    df -h | awk '$NF=="/"{printf "Uso de Disco: %s\t%.1fGB usados de %.1fGB", $5, $3, $2}' || echo "Error obteniendo uso de disco."
}

# Main function
monitor_resources() {
    while true; do
        clear
        echo "======= Monitor de Recursos del Sistema ======="
        echo "Fecha y Hora: $(date)"
        echo "----------------------------------------------"
        echo "$(get_cpu_usage)"
        echo "$(get_memory_usage)"
        echo "$(get_disk_usage)"
        echo "----------------------------------------------"
        echo "Actualizando cada 5 segundos. Presione Ctrl+C para salir."
        sleep 5
    done
}

# Run the monitor
monitor_resources
