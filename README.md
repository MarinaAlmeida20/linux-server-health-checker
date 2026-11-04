# Linux Server Health Checker

## Project Overview

A simple Linux server health-checking script built with Bash.

The project was created as part of my Site Reliability Engineering (SRE) learning journey to practise Linux commands, shell scripting, system monitoring and basic troubleshooting.

## Features

The script checks:

- **System information:** hostname and system uptime.
- **Memory usage:** available memory percentage, with OK, WARNING and CRITICAL thresholds.
- **Disk usage:** root filesystem usage, with OK, WARNING and CRITICAL thresholds.
- **Top CPU processes:** displays the five processes with the highest CPU usage.
- **Top memory processes:** displays the five processes with the highest memory usage.
- **Service status:** checks whether the cron service is running.
- **Failed services:** identifies services reported as failed by systemd.

## Technologies

- Linux (Ubuntu 24.04)
- Bash
- Windows Subsystem for Linux (WSL)
- systemd

## How to Run

Clone the repository:

```bash
git clone YOUR_REPOSITORY_URL
```

Navigate to the project directory:

```bash
cd linux-health-checker
```

Make the script executable:

```bash
chmod +x health-check.sh
```

Run the script:

```bash
./health-check.sh
```

## Example Output

```text
MEMORY INFORMATION
OK: 93% memory available

DISK INFORMATION
OK: Disk usage is 1%

SERVICE CHECK
OK: cron service is running

FAILED SERVICES CHECK
OK: No failed services
```

## What I Learned

Through this project, I practised:

- Navigating the Linux terminal.
- Using Linux commands to inspect system resources.
- Understanding processes and services.
- Using Bash variables and conditional statements.
- Applying basic monitoring thresholds.
- Checking service health with systemctl.
- Building and testing a simple Linux automation script.

## Limitations

This is a beginner learning project running in a local Ubuntu environment through WSL. It is not intended to be a production monitoring solution.

The CPU section lists processes by CPU usage; it does not calculate overall CPU utilisation.

## Author

Created as part of my SRE learning journey.
