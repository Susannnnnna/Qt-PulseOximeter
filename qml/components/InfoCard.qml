import QtQuick
import QtQuick.Controls
import "../styles" //singleton

Rectangle {
    property string title
    property string description

    width: 300
    height: 250
    color: MyStyles.cardsBackgroundColor
    border.color: MyStyles.linesColor
    border.width: 0
    radius: 10

    Column {
        anchors.centerIn: parent
        spacing: 5

        Text {
            text: title
            color: MyStyles.backgroundColor
            font.bold: true
            font.pointSize: MyStyles.fontSize
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            width: parent.width
            text:  description
            color: MyStyles.backgroundColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
    }
}
