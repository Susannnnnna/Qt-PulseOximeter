import QtQuick
import QtQuick.Controls

Button {
    id: button

    property alias buttonText: button.text
    property color buttonColor: "#32CD32"
    property var onButtonClicked

    width: parent.width * 0.8
    height: 40
    font.pixelSize: 16

    onClicked: {
        if (onButtonClicked) {
            onButtonClicked()
        }
    }

    background: Rectangle {
//        implicitWidth: 100
//        implicitHeight: 40
//        opacity: enabled ? 1 : 0.3
        color: button.buttonColor
//        border.color: control.down ? "#17a81a" : "#bcebbf"
//        border.width: 4
        radius: 7
    }
}
