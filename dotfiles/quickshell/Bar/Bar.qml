import Quickshell
import QtQuick
import QtQuick.Layouts
import ".."
import "Time"
import "Memory"
import "Cpu"
import "Workspaces"
import "Battery"
import "Network"
import "Volume"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                left: true
                right: true
                top: true
            }

            implicitHeight: 30
            color: "transparent"

            Rectangle {
                id: barSurface

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: parent.width - 100
                color: Style.bgcolor
                radius: 12
                
                RowLayout {
                    anchors.left: parent.left
                    anchors.leftMargin: 17
                    anchors.verticalCenter: parent.verticalCenter
                    Text { text: "left of bar"; color: "#ffffff" }
                }

                RowLayout {
                    anchors.centerIn: parent
                    WorkspacesWidget {}
                }

                RowLayout {
                    anchors.right: parent.right
                    anchors.rightMargin: 17
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 7

                    VolumeWidget {}
                    SepWidget {}
                    NetworkWidget {}
                    SepWidget {}
                    CpuWidget {}
                    SepWidget {}
                    MemWidget {}
                    SepWidget {}
                    BatteryWidget {}
                    SepWidget {}
                    TimeWidget {}
                }
            }
        }
    }
}
