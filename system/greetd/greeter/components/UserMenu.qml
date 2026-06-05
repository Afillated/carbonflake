pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import qs.services

ClippingRectangle {
    id: listRec
    color: "#44111111"
    radius: 12
    signal clicked
    required property real delegateHeight
    required property real fontSize
    implicitHeight: userList.contentHeight + 20
    border {
        color: "#33967373"
        width: 1
    }
    ListView {
        id: userList
        anchors.fill: parent
        model: Users.userModel
        anchors.margins: 10
        spacing: 8
        delegate: Rectangle {
            id: userRec
            required property string nameRole
            property string username: ""
            color: area.containsMouse ? "#66010101" : "transparent"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
            border {
                color: area.containsMouse ? "#33967373" : "transparent"
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
                width: 1
            }
            radius: 12
            width: userList.width
            height: listRec.delegateHeight
            Process {
                running: true
                command: ["sh", "-c", `getent passwd ${userRec.nameRole} | cut -d: -f5 | cut -d, -f1`]
                stdout: StdioCollector {
                    onStreamFinished: userRec.username = this.text.trim() || userRec.nameRole
                }
            }
            Text {
                text: userRec.username
                anchors.centerIn: parent
                color: area.containsMouse ? "#960000" : "#967373"
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
                font.pixelSize: listRec.fontSize
            }
            MouseArea {
                id: area
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                onClicked: {
                    listRec.clicked();
                    Greeterd.createSession(userRec.nameRole)
                }
            }
        }
    }
}
