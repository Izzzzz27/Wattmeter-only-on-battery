#!/bin/bash


EXTENSION_UUID="battery-usage-wattmeter@halfmexicanhalfamazing.gmail.com"


check_power_source() {
    power_status=$(upower -i $(upower -e upower | grep BAT) | grep state | awk '{print $2}')
    echo "$power_status"
}

# Function to enable the extension
enable_extension() {
    gnome-extensions enable "$EXTENSION_UUID"
    echo "Enabled extension: $EXTENSION_UUID"
}

# Function to disable the extension
disable_extension() {
    gnome-extensions disable "$EXTENSION_UUID"
    echo "Disabled extension: $EXTENSION_UUID"
}


while true; do
    if [ "$(check_power_source)" == "discharging" ]; then
        enable_extension
    else
        disable_extension
    fi
    sleep 5 # Adjust the interval as needed
done
