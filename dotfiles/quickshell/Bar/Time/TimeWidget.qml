import QtQuick
import "../.."

Text {
    text: Time.time
    font.pixelSize: Style.fontSize
    font.family: Style.fontFamily
    font.bold: true
    color: "#ffffff"
}
