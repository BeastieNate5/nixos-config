import Quickshell
import Quickshell.Io
import QtQuick
import "../.."

Text {
    id: batteryWidget
    property int batteryLevel: 0
    property bool batteryCharging: false

    text: {
        const icons = ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
        const chargingIcons = ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]

        const selectedIcon = batteryCharging ? chargingIcons[Math.min(Math.floor(batteryLevel/10),10)-1] : icons[Math.min(Math.floor(batteryLevel/10),10)-1]
        selectedIcon + " " + batteryLevel.toString() + "%"
    }
    

    font.family: Style.fontFamily
    font.pixelSize: Style.fontSize
    font.bold: true
    color: {
        if (batteryCharging) {
            return Style.pcolor || "#46e041"
        }
        if (batteryLevel < 10) {
            return "#ff5555"
        }
        else {
            return "#ffffff"
        }
    }
    Process {
        id: fetchBattery     
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo 100"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                batteryWidget.batteryLevel = parseInt(data.trim()) || 0
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: batteryStatus
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo Full"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                batteryWidget.batteryCharging = (data.trim() === "Charging" || data.trim() === "Full")
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            fetchBattery.running = true 
            batteryStatus.running = true
        }
    }
}
