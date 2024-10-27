import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: addDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property var onConfirmAction
    property string buttonText: ""
    property string firstFieldLabel: ""
    property string secondFieldLabel: ""
    property string firstFieldPlaceholderText: "YYYY-MM-DD HH:MM"
    property string secondFieldPlaceholderText
    property int selectedDataId: -1

    background: Rectangle {
        id: backgroundRectangle
        color: MyStyles.dialogBackgroundColor
        width: 300
        height: 200
        radius: 10
        border.color: MyStyles.dialogConfirmBorderColor
        border.width: 2
    }

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Label {
            text: firstFieldLabel
            font.pixelSize: 12
        }

        TextField {
            id: firstFieldInput
            placeholderText: firstFieldPlaceholderText
            font.pixelSize: 14
            bottomPadding: 0
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
            text: secondFieldLabel
            font.pixelSize: 12
        }

        TextArea {
            id: secondFieldInput
            placeholderText: secondFieldPlaceholderText
            font.pixelSize: 14
            wrapMode: Text.Wrap
            width: 250
            height: 45
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            padding: 0
            color: MyStyles.fontColor
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
                if (addDialog.onConfirmAction) {
                    addDialog.onConfirmAction(firstFieldInput.text, secondFieldInput.text);
                    addDialog.visible = false;
                } else {
                    console.log("[AddDialog.qml] Action function is not set");
                }
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            firstFieldInput.text = "";
            secondFieldInput.text = "";
        }
    }
}
