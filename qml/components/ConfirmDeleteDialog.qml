import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: confirmDeleteDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property var onDeleteConfirmed
    property string itemTextLabel: ""
    property string warningIcon: "qrc:/assets/icons/warning.png"
    property int selectedDataId: -1

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
            text: `Are you sure you want\nto delete this ${itemTextLabel}?`
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

            onClicked: {
                if (confirmDeleteDialog.onDeleteConfirmed && selectedDataId >= 0 ) {
                    confirmDeleteDialog.onDeleteConfirmed(selectedDataId);
                    confirmDeleteDialog.close();
                }
            }
        }
    }
}
