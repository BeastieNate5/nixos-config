pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string mem: "" 
    Scope {
        Process {
            id: memProcess
            running: true
            command: ["sh", "-c", "free | grep Mem | awk '{print int($3/$2*100)}'"]
            stdout: StdioCollector {
                onStreamFinished: root.mem = this.text.trim()
            }
        }

        Timer {
            interval: 3000
            running: true
            repeat: true
            onTriggered: memProcess.running = true
        }
    }
}
