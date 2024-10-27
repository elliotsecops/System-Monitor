### System Monitor Script

This script provides real-time monitoring of CPU, memory, and disk usage on a Unix-like system. It is designed to be easy to use and highly configurable.

#### Features

- **Real-Time Monitoring**: Displays CPU, memory, and disk usage every few seconds.
- **Customizable Interval**: Users can set the refresh interval.
- **Multiple Disk Monitoring**: Supports monitoring multiple disk mount points.
- **Configuration File**: Allows loading configuration from an external file.
- **Graceful Exit**: Handles `SIGINT` (Ctrl+C) and `SIGTERM` signals to exit gracefully.

#### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/elliotsecops/System-Monitor.git
   cd System-Monitor
   ```

2. **Make the Script Executable**

   ```bash
   chmod u+x system_monitor.sh
   ```

3. **Install the Script**

   ```bash
   ./install.sh
   ```

#### Usage

##### Basic Usage

To run the script with default settings:

```bash
system_monitor
```

##### Command-Line Options

- **Set Interval**: Use the `-i` or `--interval` option to set the refresh interval in seconds.

  ```bash
  system_monitor -i 10
  ```

- **Add Disk Mount Points**: Use the `-d` or `--disk` option to add disk mount points to monitor.

  ```bash
  system_monitor -d /mnt/data -d /mnt/backup
  ```

- **Load Configuration File**: Use the `-c` or `--config` option to load configuration from a file.

  ```bash
  system_monitor -c config.sh
  ```

- **Display Help**: Use the `-h` or `--help` option to display the help message.

  ```bash
  system_monitor -h
  ```

##### Configuration File

You can create a configuration file to set default values for interval and disk mount points. Here is an example `config.sh`:

```bash
INTERVAL=5
DISKS="/ /mnt/data /mnt/backup"  # Space-separated
```

Place this file in the same directory as the script or specify its path when running the script with the `-c` option.

#### Example

To monitor CPU, memory, and disk usage every 10 seconds, including `/mnt/data` and `/mnt/backup` mount points, using a configuration file:

1. Create a configuration file `config.sh`:

   ```bash
   INTERVAL=10
   DISKS="/mnt/data /mnt/backup"
   ```

2. Run the script with the configuration file:

   ```bash
   system_monitor -c config.sh
   ```

#### Troubleshooting

- **Script Not Found**: Ensure the script is executable and located in your current directory or specify the full path.
- **Invalid Interval**: The interval must be a positive integer. If you encounter an error, check the interval value.
- **Disk Mount Points**: Ensure the specified disk mount points exist and are accessible.

#### Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

#### License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
