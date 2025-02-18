import QtQuick 2.15
import "../styles" //singleton

Image {
    id: imageId

    property string iconPath
    property bool iconVisible: true
    property real widthMultiplier: 1
    property real heightMultiplier: 1

    visible: iconVisible
    source: iconPath
    width: MyStyles.iconWidth * widthMultiplier
    height: MyStyles.iconHeight * heightMultiplier
    anchors.verticalCenter: parent.verticalCenter
}
