import Quickshell
import Quickshell.Wayland
import QtQuick

import qs.components

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: background
            color: "#00000000"
            required property var modelData
            screen: modelData
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }
            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Bottom
            ClockWidget {
                id: cock
                size: background.modelData.height / 8
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: background.modelData.height / 4
                }
            }
            DateWidget {
                id: dae
                size: cock.size / 3
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: cock.top
                    bottomMargin: dae.size / 10
                }
            }
            Rectangle {
                id: sessionRec
                color: "#33000000"
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                    rightMargin: dae.size
                    bottomMargin: dae.size
                }
                radius: 10
                implicitHeight: background.modelData.height/10
                implicitWidth: background.modelData.width/8
                SessionLayout {
                    id: layout
                    anchors.fill: parent
                    fontSize: dae.size
                    butRadius: 10
                }
            }
        }
    }
}
