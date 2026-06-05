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
        color: area2.containsMouse ? "#66010101" : "transparent"
        Behavior on color {
            ColorAnimation {
                duration: 200
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
            color: area2.containsMouse ? "#33967373" : "transparent"
            width: 2
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }
        Text {
            text: "󰐥"
            color: area2.containsMouse ? "#960000" : "#967373"
            anchors.centerIn: parent
            font.pixelSize: sessionLayout.fontSize
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
    Rectangle {
        id: restartButton
        radius: sessionLayout.butRadius
        color: area3.containsMouse ? "#6010101" : "transparent"
        Behavior on color {
            ColorAnimation {
                duration: 200
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
            color: area3.containsMouse ? "#33967373" : "transparent"
            width: 2
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }

        Text {
            text: "󰜉"
            color: area3.containsMouse ? "#960000" : "#967373"
            anchors.centerIn: parent
            font.pixelSize: sessionLayout.fontSize
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
