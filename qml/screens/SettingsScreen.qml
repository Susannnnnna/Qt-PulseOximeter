import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles //singleton
import "../components"

Page {
    anchors.fill: parent
    background: parent

    ListView {
        id: settingsList
        anchors.fill: parent

        model: ListModel {
            ListElement { label: "Nick";        userData: "userTest" }
            ListElement { label: "Birth year";  userData: "1994" }
            ListElement { label: "Weight [kg]"; userData: "53" }
            ListElement { label: "Height [cm]"; userData: "162" }
            ListElement { label: "Gender";      userData: "Female" }
        }

        delegate: SwipeDelegate {
            width: parent.width
            height: MyStyles.listHeight

            Rectangle {
                width: parent.width
                height: parent.height
                color: MyStyles.backgroundColor

                // Text left aligned (first field)
                Text {
                    text: model.label
                    color: MyStyles.fontColor
                    font.pixelSize: 16
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                // Text right aligned (second field)
                Text {
                    text: model.userData
                    color: MyStyles.fontColor
                    font.pixelSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {}
                }
            }

            // Bottom-line after every row in the list
            Rectangle {
                width: parent.width * 0.98
                height: 1
                color: MyStyles.listBorderColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
        }
    }
}
