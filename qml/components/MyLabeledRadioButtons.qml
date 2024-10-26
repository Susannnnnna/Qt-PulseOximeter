import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    property string labelText: "Default Label"
    property int numberOfButtons: 2
    property var buttonLabels: ['Yes', 'No']

    Column {
        spacing: 10

        Label {
            id: label
            text: parent.labelText
            font.pixelSize: 18
            color: "black"
        }

        Repeater {
            model: parent.numberOfButtons
            delegate: RadioButton {
                text: parent.buttonLabels[index] ? parent.buttonLabels[index] : "Option " + (index + 1)
                Layout.fillWidth: true
            }
        }
    }

    Component.onCompleted: {
        if(buttonLabels.length !== numberOfButtons) {
            console.error("IDK what is going on ?!")
        }
    }
}





















