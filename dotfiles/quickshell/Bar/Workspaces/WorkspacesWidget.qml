import QtQuick
import Quickshell
import Quickshell.Io
import "../.."

Item {
    id: root
    implicitWidth: workspaceRow.implicitWidth
    implicitHeight: workspaceRow.implicitHeight

    property var workspaces: []
    property int activeWorkspace: 1
    
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

    Row {
        id: workspaceRow
        spacing: 6


        Repeater {
            model: root.workspaces 
            Rectangle {
                width: 20
                height: 20
                color: "transparent"
                Text {
                    text: modelData.idx.toString() 
                    font.pixelSize: Style.fontSize
                    font.family: Style.fontFamily
                    color: (modelData.id === root.activeWorkspace ? Style.pcolor : "#ffffff") || "#ffffff"
                    Behavior on color { ColorAnimation { duration: 100 } }

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
