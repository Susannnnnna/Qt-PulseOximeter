import QtQuick 2.15
import QtQuick.Controls.Material
import MyStyles 1.0 //singleton

TabButton {
    id: componentTab

    property string stackViewPath
    property string iconPath

    contentItem: Column {
        spacing: 0
        Image {
            source: iconPath
            width: MyStyles.iconWidth - 5
            height: MyStyles.iconHeight - 5
            anchors.centerIn: parent
        }
    }

    Rectangle {
        width: componentTab.width
        height: 3
        color: "green"
        anchors.bottom: componentTab.top
    }
    onClicked: {
        stackView.push(stackViewPath)
    }
}
