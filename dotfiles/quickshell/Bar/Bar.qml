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
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.leftMargin: 17

                        RowLayout {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left

                            Text {
                                text: "left of bar"
                                color: "#ffffff"
                            }
                        }

                        
                        /*
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "red"
                            border.width: 1
                        }
                        */
                        

                    }


                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.verticalCenter: parent.verticalCenter 
                            anchors.horizontalCenter: parent.horizontalCenter
                            WorkspacesWidget {}
                        }

                        /* 
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "red"
                            border.width: 1
                        }
                        */ 
                    }


                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.rightMargin: 17

                        RowLayout {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 7
                            
                            VolumeWidget {}
                            SepWidget{}
                            NetworkWidget {}
                            SepWidget{}
                            CpuWidget {}
                            SepWidget{}
                            MemWidget {}
                            SepWidget {}
                            BatteryWidget {}
                            SepWidget {}
                            TimeWidget {}
                        }

                        /*
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "red"
                            border.width: 1
                        }
                        */
                    }
                }

            }
        }
    }
}
