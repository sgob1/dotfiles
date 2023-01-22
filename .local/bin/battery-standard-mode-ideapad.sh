#!/usr/bin/env bash
set -e
echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
echo "Battery conservation mode disabled."
