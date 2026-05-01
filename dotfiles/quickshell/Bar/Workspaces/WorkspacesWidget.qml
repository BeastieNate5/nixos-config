import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../.."

Item {
    id: root
    property var workspaces: []
    property int activeWorkspace: 1
    property int hPadding: 15
    property int vPadding: 3

    implicitWidth: workspaceRow.implicitWidth + hPadding
    implicitHeight: workspaceRow.implicitHeight + vPadding

    Process {
        id: niriIpc
        command: ["niri", "msg", "--json", "event-stream"]
        running: true
        stdout: SplitParser {
            onRead: line => {
                let event = JSON.parse(line)

                if (event.WorkspacesChanged) {
                    root.workspaces = event.WorkspacesChanged.workspaces.sort((a, b) => a.idx - b.idx);
                }
                else if (event.WorkspaceActivated) {
                    root.activeWorkspace = event.WorkspaceActivated.id
                }
            }
        }
    }

    Process {
        id: niriAction
    }

    Rectangle {
        id: background
        width: workspaceRow.implicitWidth + root.hPadding
        height: workspaceRow.implicitHeight + root.vPadding

        radius: 50
        color: "#262626"

        RowLayout {
            id: workspaceRow
            spacing: 6
            anchors.fill: parent

            anchors.rightMargin: root.hPadding / 2
            anchors.leftMargin: root.hPadding / 2
            anchors.topMargin: root.vPadding / 2
            anchors.bottomMargin: root.vPadding / 2

            Text {
                text: root.workspaces.findIndex(item => item.id === root.activeWorkspace) + 1
                color: "white"
                Layout.rightMargin: 2
                Layout.alignment: Qt.AlignVCenter
                font.family: Style.fontFamily
                font.pixelSize: Style.fontSize
                font.bold: true
            }

            Repeater {
                model: root.workspaces
                Rectangle {
                    Layout.preferredWidth: (modelData.id === root.activeWorkspace ? 30 : 20)
                    Layout.preferredHeight: (modelData.id === root.activeWorkspace ? 11 : 7)
                    color: (modelData.id === root.activeWorkspace ? Style.pcolor : "#ffffff") || "#ffffff"
                    radius: 50

                    Layout.alignment: Qt.AlignCenter

                    Behavior on color { ColorAnimation { duration: 100 } }
                    Behavior on Layout.preferredWidth {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.InOutQuad
                        }
                    }
                    Behavior on Layout.preferredHeight {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.InOutQuad
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            niriAction.command = ["niri", "msg", "action", "focus-workspace", modelData.idx.toString()];
                            niriAction.running = true
                        }
                    }
                }
            }
        }
    }
}
