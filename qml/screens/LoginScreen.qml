import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"
import "../styles"

Item {
    id: root
    width: parent.width
    height: parent.height

    Rectangle {
        anchors.fill: parent
        color: "#FFDEAD"  // jednolity kolor tła

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Explore your health!"
                color: "#2F4F4F"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MyTextField {
                labelText: "Username or Email"
                validateAsNumber: false
            }

            MyTextField {
                labelText: "Password"
                isPassword: true
                validateAsNumber: false
            }

            MyButton {
                buttonText: "Continue"
                onButtonClicked: function() {
                    console.log("Clicked")
                }
            }

            MyButton {
                buttonText: "Create Account"
                onButtonClicked: function() {
                    console.log("Clicked - Create Account")
                }
            }
        }
    }
}
