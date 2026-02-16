pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string cpuUsage: "0" 
    property int lastTotal: 0 
    property int lastIdle: 0 
    Scope {
        Process {
            id: cpuProcess
            running: true
            command: ["sh", "-c", "head -1 /proc/stat"]
            stdout: SplitParser {
                onRead: data => {
                    if (!data) return
                    var p = data.trim().split(/\s+/)
                    var idle = parseInt(p[4]) + parseInt(p[5])
                    var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)

                    if (root.lastTotal > 0) {
                        var cpuUsage = Math.round(100 * (1 - (idle - root.lastIdle) /(total - root.lastTotal) ))
                        root.cpuUsage = cpuUsage.toString()
                    }

                    root.lastTotal = total
                    root.lastIdle = idle
                }
            }
        }

        Timer {
            interval: 3000
            running: true
            repeat: true
            onTriggered: cpuProcess.running = true
        }
    }
}
