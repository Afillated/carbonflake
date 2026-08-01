import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import qs.services

Text {
    id: clock
    text: Time.time
    property real size
    font {
        family: "Comfortaa"
        pixelSize: size
        weight: 500
    }
    color: "#967373"
    renderType: Text.NativeRendering
}
