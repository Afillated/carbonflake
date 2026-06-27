pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import qs.services

ClippingRectangle {
    id: listRec
    color: "#44111111"
    radius: 12
    border {
        color: "#33967373"
        width: 1
    }
    implicitHeight: sessionList.contentHeight + 20
    required property real delegateHeight
    required property real fontSize
    ListView {
        id: sessionList
        model: Sessions.model
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 8
        delegate: Rectangle {
            id: delegateRec
            radius: 12
            width: sessionList.width
            height: listRec.delegateHeight
            required property string name
            required property var modelData
            required property int index
            color: area.containsMouse || Sessions.currentIndex === index ? "#66010101" : "transparent"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
            border {
                color: area.containsMouse || Sessions.currentIndex === index ? "#33967373" : "transparent"
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
                width: 1
            }
            MouseArea {
                id: area
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                onClicked: {
                    Sessions.currentIndex = delegateRec.index;
                }
            }
            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                Text {
                    Layout.fillWidth: true
                    text: delegateRec.name
                    elide: Text.ElideRight
                    color: area.containsMouse || Sessions.currentIndex === delegateRec.index ? "#960000" : "#967373"
                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                        }
                    }
                    font.pixelSize: listRec.fontSize
                }
            }
        }
    }
}
