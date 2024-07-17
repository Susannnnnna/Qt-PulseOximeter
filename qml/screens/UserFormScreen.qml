import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"
import "../sampleData"
import "../styles"

ScrollView {
    width: parent.width
    height: parent.height

    ColumnLayout {
        width: parent.width
        spacing: 1

        MyTextField {
            labelText: "Weight [cm]"
        }

        MyTextField {
            labelText: "Mood"
        }

        MyTextField {
            labelText: "Calories consumed [kcal]"
        }

        MyTextField {
            labelText: "Water [L]"
        }

        MyTextField {
            labelText: "Sleep amount"
        }

        MyTextField {
            labelText: "Sleep quality"
        }

        MyTextField {
            labelText: "Stress Level"
        }

        MyLabeledRadioButtons {
            labelText: "Drugs"
            numberOfButtons: 2
            //buttonLabels: ['Yes', 'No']
            anchors.centerIn: parent
        }

        MyTextField {
            labelText: "Medicines"
        }

        MyTextField {
            labelText: "Suplements"
        }

        Item {
            Layout.fillHeight: true
            width: 1  // Minimal width to make it non-intrusive
        }

        Row {
            id: buttonRow
            spacing: 10
            Layout.alignment: Qt.AlignBottom

            MyButton {
                buttonText: "Details"
                buttonColor: "#ffff00"
                onButtonClicked: function() {
                    console.log("Clicked Details")
                }
            }

            MyButton {
                buttonText: "Add"
                buttonColor: "#55ff55"
                onButtonClicked: function() {
                    console.log("Clicked Add")
                }
            }

            MyButton {
                buttonText: "Update"
                buttonColor: "#5555ff"
                onButtonClicked: function() {
                    console.log("Clicked Update")
                }
            }

            MyButton {
                buttonText: "Delete"
                buttonColor: "#ff5555"
                onButtonClicked: function() {
                    console.log("Clicked Delete")
                }
            }
        }
    }
}
