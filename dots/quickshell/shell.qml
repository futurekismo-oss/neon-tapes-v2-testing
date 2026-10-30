import Qt.labs.platform
import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.namespace: "Nox:wallpaper"
    aboveWindows: false
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    focusable: false

    anchors {
        bottom: true
        left: true
        right: true
        top: true
    }

    Item {
        anchors {
            fill: parent
            margins: 20
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: "#c084fc"
            border.width: 2
            radius: 12

            Rectangle {
                id: mask
                anchors.fill: parent
                radius: parent.radius
                visible: false
            }

            Image {
                anchors.fill: parent
                asynchronous: true
                cache: false
                fillMode: Image.PreserveAspectCrop
                smooth: true
                sourceSize.height: height
                sourceSize.width: width
                source: "/home/futurekismo/Wallpapers/wallhaven.png"

                layer.enabled: true
                layer.effect: ShaderEffect {
                    property var maskSource: mask
                }
            }
        }
    }
}
