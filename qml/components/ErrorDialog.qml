import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: errorDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property string warningIcon: "qrc:/assets/icons/warning.png"

    background: Rectangle {
        color: MyStyles.dialogBackgroundColor
        width: 200
        height: 175
        radius: 10
        border.color: MyStyles.dialogWarningBorderColor
        border.width: 2
    }

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Image {
            source: warningIcon
            width: 35
            height: 35
            x: confirmDeleteDialog.width - 100
        }

        Label {
            text: "Invalid date format. \nExpected format: \n[YYYY-MM-DD HH:MM]"
            font.pixelSize: 16
        }

        Button {
            text: MyStyles.buttonTextOK
            hoverEnabled: false
            font.pixelSize: 14
            x: confirmDeleteDialog.width - 50
            background: Rectangle {
                color: MyStyles.buttonInnerColor
                border.color: MyStyles.buttonBorderColor
                border.width: 1
                radius: 4
            }

            onClicked: errorDialog.visible = false
        }
    }
}
