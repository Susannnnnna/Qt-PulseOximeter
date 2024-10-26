import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: addOrEditDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property string buttonText: ""
    property string firstField: ""
    property string secondField: ""
    property int selectedDataId: -1

    background: Rectangle {
        id: backgroundRectangle
        color: "white"
        width: 300
        height: 190
        radius: 10
        border.color: "green"
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
            placeholderText: "RRRR-MM-DD HH:MM"
            font.pixelSize: 14
            bottomPadding: 1
            background: Rectangle {
                color: "transparent"
            }
            Rectangle {
                height: 0.5
                width: 250
                color: "lightgray"
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
                color: "lightgray"
                anchors.bottom: parent.bottom
            }
        }

        Button {
            text: buttonText
            hoverEnabled: false
            font.pixelSize: 14
            x: backgroundRectangle.width - 100
            background: Rectangle {
                color: "#FFD700" // yellow type
                border.color: "black"
                border.width: 1
                radius: 4
            }

            onClicked: {
                addOrEditDialog.visible = false
//                if (mode === "add") {
//                    dataController.addData("testUser", firstFieldInput.text, secondFieldInput.text);
//                    addDataToModel(firstFieldInput.text, secondFieldInput.text);
//                } else {
//                    dataController.editData(selectedDataId, firstFieldInput.text, secondFieldInput.text);
//                    updateDataInModel(selectedDataId, firstFieldInput.text, secondFieldInput.text);
//                }
//                addOrEditDialog.close();
            }
        }
    }
}
