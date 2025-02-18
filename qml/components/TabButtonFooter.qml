import QtQuick 2.15
import QtQuick.Controls.Material
import "../styles" //singleton

TabButton {
    id: componentTab

    property string stackViewPath
    property string iconPath
    property string labelText

    contentItem: Column {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            source: iconPath
            width: MyStyles.iconWidth
            height: MyStyles.iconHeight
            anchors.centerIn: parent
        }
        // Rectangle {
        //     width: 2
        //     height: 1
        //     color: "transparent"
        // }
        // Text {
        //     text: labelText
        //     font.pixelSize: 10
        //     color: "black"
        //     anchors.horizontalCenter: parent.horizontalCenter
        // }
    }

    // LineSeparator { lineHeight: 3; lineColor: MyStyles.linesColor; anchors.horizontalCenter: parent.top }

    Rectangle {
        width: componentTab.width
        height: 3
        color: MyStyles.linesColor
        anchors.bottom: componentTab.top
    }
    onClicked: {
        stackView.push(stackViewPath)
    }
}
