import Quickshell
import QtQuick

import qs.services

Text {
    id: date
    text: Time.date
    // text: Greeterd.user
    color: "#967373"
    property real size
    font {
        family: "Comfortaa"
        pixelSize: size
        weight: 500
    }
    renderType: Text.NativeRendering
}
