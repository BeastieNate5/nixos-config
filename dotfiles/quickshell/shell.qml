import Quickshell
import QtQuick
import "Bar"
import "Volume"
import "GamePopup"

ShellRoot {
    VolumeWidget {}
    Variants {
        model: Quickshell.screens

        Item {
            Bar { 
                modelData: modelData
                gamepopupHandle: gamePopup
            }
            GamePopup { id: gamePopup }
        }
    }
}
