import Quickshell
import QtQuick
import ".."

PanelWindow {
    anchors.top: true
    anchors.left: true
    visible: false

    height: 300
    width: 200

    margins {
        left: visible ? 10 : -width
        top: 10
    }

    Behavior on margins.left {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutCubic
        }
    }

    exclusiveZone: 0

    Rectangle {
        anchors.fill: parent
        radius: 12
        color: Style.bgcolor


        Text { text: "123" }
    }
}
