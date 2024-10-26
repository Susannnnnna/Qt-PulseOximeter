import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: editDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property var onConfirmAction
    property string buttonText: ""
    property string firstField: ""
    property string secondField: ""

    background: Rectangle {
        id: backgroundRectangle
        color: MyStyles.dialogBackgroundColor
        width: 300
        height: 190
        radius: 10
        border.color: MyStyles.dialogConfirmBorderColor
        border.width: 2
    }

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Label {
            text: firstField
            font.pixelSize: 12
        }

        TextField {
            id: firstFieldInput
            font.pixelSize: 14
            bottomPadding: 1
            background: Rectangle {
                color: "transparent"
            }
            Rectangle {
                height: 0.5
                width: 250
                color: MyStyles.dialogUnderlineLine
                anchors.bottom: parent.bottom
            }
        }

        Label {
            text: secondField
            font.pixelSize: 12
        }

        TextField {
            id: secondFieldInput
            font.pixelSize: 14
            bottomPadding: 1
            background: Rectangle {
                color: "transparent"
            }
            Rectangle {
                height: 1
                width: 250
                color: MyStyles.dialogUnderlineLine
                anchors.bottom: parent.bottom
            }
        }

        Button {
            text: buttonText
            hoverEnabled: false
            font.pixelSize: 14
            x: backgroundRectangle.width - 100
            background: Rectangle {
                color: MyStyles.buttonInnerColor
                border.color: MyStyles.buttonBorderColor
                border.width: 1
                radius: 4
            }

            onClicked: {
                if (editDialog.onConfirmAction) {
                    editDialog.onConfirmAction(firstFieldInput.text, secondFieldInput.text); //selectedDataId,
                    editDialog.visible = false;
                    //editDialog.selectedDataId = -1;
                } else {
                    console.log("Action function is not set");
                }
            }
        }
    }
}
