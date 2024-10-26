import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Button {
    id: addButton

    property var addDataDialog
    property string addIcon: "qrc:/assets/icons/add.png"

    width: MyStyles.buttonWidth
    height: MyStyles.buttonHeight
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.rightMargin: 40
    anchors.bottomMargin: 40
    hoverEnabled: false
    highlighted: false

    background: Rectangle {
        color: MyStyles.buttonColor
    }
    Image {
        source: addIcon
        width: MyStyles.iconWidth
        height: MyStyles.iconHeight
        anchors.centerIn: parent
    }

    onClicked: addDataDialog.open()
}
