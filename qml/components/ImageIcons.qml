import QtQuick 2.15
import MyStyles 1.0 //singleton

Image {
    id: imageId

    property string iconPath
    property bool iconVisible: true

    visible: iconVisible
    source: iconPath
    width: MyStyles.iconWidth
    height: MyStyles.iconHeight
    anchors.verticalCenter: parent.verticalCenter
}
