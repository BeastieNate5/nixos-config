import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell
import "../.."

Text {
    text: " " + Cpu.cpuUsage + "%"
    font.pixelSize: Style.fontSize
    font.family: Style.fontFamily
    font.bold: true
    color: "#ffffff"
}
