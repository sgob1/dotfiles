#!/usr/bin/env bash
set -e
status=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
if [[ $status = "1" ]]; then
    echo "Conservation mode enabled."
    echo "Battery status:"
    acpi
elif [[ $status = "0" ]]; then
    echo "Conservation mode disabled."
    echo "Battery status:"
    acpi
fi
