import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import MyStyles //singleton

Button {
    width: page.width * 0.9
    height: 40

    property string buttonText: ""
    property string rightArrowIcon: "qrc:/assets/icons/right-arrow-angle.png"

    hoverEnabled: false
    highlighted: false

    background: Rectangle {
        color: "white"
        border.color: "green"
        border.width: 1
        radius: 10
    }

    contentItem: Row {
        anchors.fill: parent
        anchors.margins: 10

        Text {
            text: buttonText
            font.pixelSize: 14
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        Image {
            source: rightArrowIcon
            width: 30
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 3
        }
    }
}
