# Monitor de Recursos del Sistema (Bash) (ESP)

## Visión General

Este script Bash monitoriza y muestra en tiempo real el uso de CPU, memoria y disco de su sistema. El script se actualiza cada 5 segundos e incluye gestión de errores para mayor robustez. Util para sysadmins y y devs que necesitan información rápida sobre el consumo de recursos.

## Características

- Monitorización en tiempo real**: Muestra el uso de CPU, memoria y disco en tiempo real.
- Intervalo de actualización**: Actualiza la información cada 5 segundos.
- Manejo de Errores**: Incluye manejo básico de errores para asegurar que el script no falle silenciosamente.
- Formato claro**: Proporciona una salida clara y consistente para una fácil lectura.

## Requisitos

- Sistema operativo**: Linux o macOS

## Instalación

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/yourusername/system-resource-monitor.git
   cd sistema-monitor-de-recursos
   ```

2. **Hacer ejecutable el script**:
   ```bash
   chmod +x sistema_monitor_de_recursos.sh
   ```

## Uso

1. **Ejecutar el Script**:
   ```bash
   ./sistema_monitor_recursos.sh
   ```

2. **Monitorizar la salida**:
   El script mostrará la fecha y hora actuales, el uso de CPU, el uso de memoria y el uso de disco. La información se actualiza cada 5 segundos.

3. **Salir del Script**:
   Pulse `Ctrl+C` para detener el script.

## Ejemplo de Salida

```
======= Monitor de Recursos del Sistema =======
Fecha y Hora: 2023-10-05 12:34:56
----------------------------------------------
Uso de CPU: 15.34%
Uso de Memoria: 45.67% 1024MB usados de 2048MB
Uso de Disco: 50% 250.0GB usados de 500.0GB
----------------------------------------------
Actualizando cada 5 segundos. Presione Ctrl+C para salir.
```

# System Resource Monitor (Bash) (EN)

## Overview

This Bash script monitors and displays real-time CPU, memory, and disk usage of your system. The script refreshes every 5 seconds and includes error handling for robustness. Ideal for sysadmins and developers who need quick insights into resource consumption.

## Features

- **Real-Time Monitoring**: Displays CPU, memory, and disk usage in real-time.
- **Refresh Interval**: Refreshes the information every 5 seconds.
- **Error Handling**: Includes basic error handling to ensure the script doesn't fail silently.
- **Clear Formatting**: Provides clear and consistent output for easy readability.

## Requirements

- **Operating System**: Linux or macOS

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/system-resource-monitor.git
   cd system-resource-monitor
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x system_resource_monitor.sh
   ```

## Usage

1. **Run the Script**:
   ```bash
   ./system_resource_monitor.sh
   ```

2. **Monitor the Output**:
   The script will display the current date and time, CPU usage, memory usage, and disk usage. The information refreshes every 5 seconds.

3. **Exit the Script**:
   Press `Ctrl+C` to stop the script.

## Example Output

```
======= Monitor de Recursos del Sistema =======
Fecha y Hora: 2023-10-05 12:34:56
----------------------------------------------
Uso de CPU: 15.34%
Uso de Memoria: 45.67%  1024MB usados de 2048MB
Uso de Disco: 50%  250.0GB usados de 500.0GB
----------------------------------------------
Actualizando cada 5 segundos. Presione Ctrl+C para salir.
```
