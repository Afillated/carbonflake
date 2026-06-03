import Quickshell
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick
import Quickshell.Io
import qs.services

RowLayout {
    id: sessionLayout
    property real fontSize
    property real butRadius
    spacing: 8
    Rectangle {
        id: shutButton
        radius: sessionLayout.butRadius
        color: area2.containsMouse ? "#CC111111" : "#55000000"
        Behavior on color {
            ColorAnimation {
                duration: 250
            }
        }
        MouseArea {
            id: area2
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            onClicked: Quickshell.execDetached(["systemctl", "poweroff"])
        }
        border {
            color: area2.containsMouse ? "#CC960000" : "#111111"
            width: 2
            Behavior on color {
                ColorAnimation {
                    duration: 250
                }
            }
        }
        Text {
            text: "󰐥"
            color: area2.containsMouse || shutButton.focus ? "#960000" : "#967373"
            anchors.centerIn: parent
            font.pixelSize: sessionLayout.fontSize
            Behavior on color {
                ColorAnimation {
                    duration: 250
                }
            }
        }
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
    Rectangle {
        id: restartButton
        radius: sessionLayout.butRadius
        color: area3.containsMouse ? "#CC111111" : "#55000000"
        Behavior on color {
            ColorAnimation {
                duration: 250
            }
        }
        MouseArea {
            id: area3
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            onClicked: Quickshell.execDetached(["systemctl", "reboot"])
        }
        border {
            color: area3.containsMouse ? "#CC960000" : "#111111"
            width: 2
            Behavior on color {
                ColorAnimation {
                    duration: 250
                }
            }
        }

        Text {
            text: "󰜉"
            color: area3.containsMouse || restartButton.focus ? "#960000" : "#967373"
            anchors.centerIn: parent
            font.pixelSize: sessionLayout.fontSize
            Behavior on color {
                ColorAnimation {
                    duration: 250
                }
            }
        }
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
