import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    width: 300
    height: textInput.height + label.height + errorLabel.height

    property string labelText: "Label"
    property string textValue: ""
    property alias textInputField: textInput.text
    property bool validateAsNumber: false
    property bool isPassword: false

    Column {
        anchors.fill: parent

        Label {
            id: label
            text: parent.parent.labelText + "  "
            font.pixelSize: 20
            font.bold: false
            color: "#2F4F4F"
            horizontalAlignment: Text.AlignLeft
        }

        TextField {
            id: textInput
            width: 250
            height: 35
            text: parent.parent.textValue
            echoMode: parent.parent.isPassword ? TextInput.Password : TextInput.Normal
            Layout.fillWidth: true

            background: Rectangle {
                color: "#FFFFF0"
                border.color: "#556B2F"
                border.width: 1
                radius: 4
            }
        }

        Label {
            id: errorLabel
            text: textInput.text !== "" && isNaN(Number(textInput.text)) && parent.parent.validateAsNumber ? "Wprowadź liczbę" : ""
            color: "#CD5C5C"
            font.pixelSize: 12
            visible: textInput.text !== "" && isNaN(Number(textInput.text)) && parent.parent.validateAsNumber
            anchors.left: textInput.right
            anchors.leftMargin: 10
            anchors.verticalCenter: textInput.verticalCenter
        }
    }
}
