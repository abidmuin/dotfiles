#!/bin/sh

# BEGIN_VARIABLES
INTERFACE="wlp4s0"
UPDATE_INTERVAL=21600 # 6 Hours in Seconds
LAST_CHECK=0
# END_VARIABLES

# CPU: Load + Temp
get_cpu() {
    load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)
    temp=$(sensors 2>/dev/null | grep "Package id 0" | awk '{print $4}' | sed 's/+//')
    echo "[CPU] $load $temp"
}

# MEMORY: Usage %
get_mem() {
    mem=$(free | awk '/Mem:/ {printf "%.0f%%", $3/$2 * 100}')
    echo "[MEM] $mem"
}

# HDD: Usage %
get_hdd() {
    hdd=$(df -h / | awk 'NR==2 {print $5}')
    echo "[HDD] $hdd"
}

# NETWORK: SSID
get_network() {
    ssid=$(iwgetid -r 2>/dev/null)
    [ -z "$ssid" ] && echo "[NET] xxx" || echo "[NET] $ssid"
}

# BLUETOOTH
get_bluetooth() {
    info=$(bluetoothctl info 2>/dev/null)
    if echo "$info" | grep -q "Connected: yes"; then
        device_name=$(echo "$info" | grep "Name:" | cut -d ' ' -f 2-)
        battery_hex=$(echo "$info" | grep "Battery Percentage" | awk '{print $3}' | tr -d '()')
        if [ -n "$battery_hex" ]; then
            [ "${battery_hex%${battery_hex#??}}" = "0x" ] && val=$(printf "%d" "$battery_hex") || val=$battery_hex
            echo "[BT] $device_name ($val%)"
        else
            echo "[BT] $device_name"
        fi
    fi
}

# VOLUME
get_volume() {
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -Po '[0-9]+(?=%)' | head -1)
    echo "[VOL] ${vol:-0}%"
}

# BRIGHTNESS
get_brightness() {
    echo "[BRI] $(brightnessctl g | awk -v m=$(brightnessctl m) '{printf "%.0f%%", $1/m * 100}')"
}

# BATTERY
get_battery() {
    BAT=$(ls /sys/class/power_supply/ | grep BAT | head -1)
    if [ -n "$BAT" ]; then
        echo "[BAT] $(cat /sys/class/power_supply/$BAT/status) $(cat /sys/class/power_supply/$BAT/capacity)%"
    fi
}

# DATE
get_date() {
    date +'%a %b %d %H:%M'
}

# MAIN LOOP
while true; do
    if [ $((SECONDS - LAST_CHECK)) -ge $UPDATE_INTERVAL ] || [ $LAST_CHECK -eq 0 ]; then
        INSTALLED_COUNT=$(xbps-query -l | wc -l)
        UPDATES_COUNT=$(xbps-install -nSu 2>/dev/null | grep -c "^index:")
        LAST_CHECK=$SECONDS
    fi

    echo "[INSTALLED] $INSTALLED_COUNT [UPDATES] $UPDATES_COUNT $(get_cpu) $(get_mem) $(get_hdd) $(get_network) $(get_bluetooth) $(get_volume) $(get_brightness) $(get_battery) | $(get_date)"
    
    sleep 10
done
