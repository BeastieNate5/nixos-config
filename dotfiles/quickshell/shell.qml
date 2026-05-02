import Quickshell
import QtQuick
import "Bar"
import "Volume"
import "GamePopup"

ShellRoot {
    VolumeWidget {}
    Variants {
        model: Quickshell.screens

        Component {
            Bar {
                modelData: modelData
                gamepopupHandle: gamePopup
            }
        }
    }
}
