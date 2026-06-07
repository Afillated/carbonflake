import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.components
import qs.services

ClippingRectangle {
    id: login
    color: "#66000000"
    signal click
    property bool butVisible: false
    property real screenHeight
    property real screenWidth
    property string username
    onButVisibleChanged: {
        if (butVisible) {
            passwordInput.forceActiveFocus();
        } else {
            Greeterd.resetMessages();
            passwordInput.text = "";
        }
    }
    Process {
        running: login.butVisible && Greeterd.user
        command: ["sh", "-c", `getent passwd ${Greeterd.user} | cut -d: -f5 | cut -d, -f1`]
        stdout: StdioCollector {
            onStreamFinished: login.username = this.text.trim() || Greeterd.user
        }
    }

    Label {
        id: username
        text: login.username
        color: "#967373"
        renderType: Text.NativeRendering
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: passwordArea.top
            bottomMargin: login.screenHeight / 64
        }
        font.pixelSize: login.screenHeight * 0.025
    }
    ClippingRectangle {
        id: passwordArea
        radius: 8
        z: 2
        opacity: login.butVisible ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 100
                easing.type: Easing.OutQuad
            }
        }
        visible: opacity > 0
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: login.screenHeight / 1.3
        }
        implicitHeight: login.screenHeight / 28
        implicitWidth: login.screenWidth / 6
        color: "#66212121"
        border {
            color: Greeterd.isWorking ? "orange" : passwordInput.activeFocus ? "#33967373" : "black"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
            width: 1
        }
        TextInput {
            id: passwordInput
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            color: "#967373"
            text: ""
            enabled: Greeterd.authing
            horizontalAlignment: Text.AlignHCenter
            cursorVisible: false
            font.pixelSize: login.screenHeight * 0.018
            echoMode: Greeterd.showResponse ? TextInput.Normal : TextInput.Password
            onAccepted: {
                Greeterd.respond(text);
                passwordInput.text = "";
            }
            font.family: "Firacode Mono Nerd Font"
            selectionColor: "#88960000"
            selectedTextColor: "#967373"
            renderType: Text.NativeRendering
            Keys.onEscapePressed: {
                passwordInput.text = "";
            }
            cursorDelegate: Rectangle {
                visible: false
            }
            HoverHandler {
                cursorShape: Qt.IBeamCursor
            }
        }
        Text {
            id: incorrect
            anchors.centerIn: parent
            text: Greeterd.majError
            color: "#967373"

            Connections {
                target: Greeterd
                function onAuthFailed() {
                    failAnim.restart();
                }
            }

            SequentialAnimation {
                id: failAnim
                NumberAnimation {
                    target: incorrect
                    property: "opacity"
                    duration: 150
                    to: 0.8
                    easing.type: Easing.InCirc
                }
            }
        }
    }
    Rectangle {
        id: closeButton
        opacity: login.butVisible ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 100
                easing.type: Easing.OutQuad
            }
        }
        visible: opacity > 0
        anchors {
            right: passwordArea.left
            rightMargin: passwordArea.implicitHeight * 0.1
            verticalCenter: passwordArea.verticalCenter
        }
        implicitHeight: passwordArea.implicitHeight
        implicitWidth: passwordArea.implicitHeight
        radius: 8
        color: closeArea.containsMouse ? "#66010101" : "#66212121"
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
        border {
            color: "#33967373"
            width: 1
        }
        Text {
            anchors.centerIn: parent
            text: ""
            font.pixelSize: parent.height * 0.6
            color: closeArea.containsMouse ? "#960000" : "#967373"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }
        MouseArea {
            id: closeArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                login.click();
                Greeterd.cancelSession();
            }
        }
    }
    Text {
        id: minor
        anchors.centerIn: parent
        text: Greeterd.minError
        color: "#967373"
        anchors {
            top: passwordArea.bottom
            topMargin: login.screenHeight / 10
            horizontalCenter: parent.horizontalCenter
        }

        Connections {
            target: Greeterd
            function onAuthMessage() {
                if (Greeterd.minError != "")
                    minorAnim.restart();
            }
        }
        SequentialAnimation {
            id: minorAnim
            NumberAnimation {
                target: minor
                property: "opacity"
                duration: 150
                to: 0.8
                easing.type: Easing.InCirc
            }
            PauseAnimation {
                duration: 500
            }
            NumberAnimation {
                target: minor
                property: "opacity"
                duration: 250
                to: 0
                easing.type: Easing.OutCirc
            }
        }
    }

    SessionMenu {
        id: sessionMenu
        opacity: login.butVisible ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 100
                easing.type: Easing.OutQuad
            }
        }
        visible: opacity > 0
        delegateHeight: login.screenHeight * 0.04
        fontSize: delegateHeight * 0.6
        anchors {
            top: parent.top
            topMargin: login.screenHeight/1.3
            left: parent.left
            leftMargin: passwordArea.implicitHeight
            bottom: parent.bottom
            bottomMargin: passwordArea.implicitHeight
            right: closeButton.left
            rightMargin: passwordArea.implicitWidth*1.4
        }
    }
}
