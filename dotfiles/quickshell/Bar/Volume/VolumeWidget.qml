import QtQuick
import Quickshell.Services.Pipewire
import "../.."

Text {
    id: root
    property bool isMuted: false

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    text: { 
        const icon = root.isMuted ? "󰝟 " : "󰕾 "
        icon + Math.round(Pipewire.defaultAudioSink?.audio.volume/1.5 * 100) + "%"
    }
    font.family: Style.fontFamily
    font.pixelSize: Style.fontSize
    font.bold: true
    color: "#ffffff"

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            return
        }

        function onMutedChanged() {
            root.isMuted = Pipewire.defaultAudioSink?.audio.muted
        }
    }
}
