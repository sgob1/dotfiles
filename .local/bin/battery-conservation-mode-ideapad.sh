#!/usr/bin/env bash
set -e
echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
echo "Battery conservation mode enabled."
