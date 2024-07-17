import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"
import "../sampleData"
import "../styles"

ScrollView {
    width: parent.width
    height: parent.height

    Column {
        anchors.centerIn: parent
        spacing: 5

        Text {
            text: "Your Data"
            color: "#2F4F4F"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MyTextField {
            labelText: "Username"
            validateAsNumber: false
        }
        MyTextField {
            labelText: "Email"
            validateAsNumber: false
        }

        MyTextField {
            labelText: "Password"
            validateAsNumber: false
        }

        MyLabeledRadioButtons {
            labelText: "Sex"
            numberOfButtons: 2
            buttonLabels: ['Female', 'Male']
            anchors.centerIn: parent
        }

        MyTextField {
            labelText: "Birth year"
            validateAsNumber: true
        }

        MyTextField {
            labelText: "Height [cm]"
        }

        MyButton {
            buttonText: "Update"
            onButtonClicked: function() {
                console.log("Clicked - Update")
            }
        }

        MyButton {
            buttonText: "Leave"
            onButtonClicked: function() {
                console.log("Clicked - Leave")
            }
        }
    }
}
