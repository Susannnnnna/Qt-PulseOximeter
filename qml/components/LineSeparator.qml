import QtQuick 2.15
import "../styles" //singleton

Rectangle {
    property real lineHeight
    property color lineColor

    width: parent.width
    height: lineHeight  // Line thickness
    color: lineColor
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
}
