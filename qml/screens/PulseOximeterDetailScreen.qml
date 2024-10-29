import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyStyles //singleton

Page {
    id: page
    anchors.fill: parent
    background: parent

    ListView {
        id: settingsList
        anchors.fill: parent

        model: ListModel {
            ListElement { spo2Label: "SpO2"; spo2Data: "99"; prLabel: "PR"; prData: "97" }
            ListElement { spo2Label: "SpO2"; spo2Data: "99"; prLabel: "PR"; prData: "97" }
            ListElement { spo2Label: "SpO2"; spo2Data: "99"; prLabel: "PR"; prData: "97" }
            ListElement { spo2Label: "SpO2"; spo2Data: "99"; prLabel: "PR"; prData: "97" }
        }

        delegate: SwipeDelegate {
            width: parent.width
            height: MyStyles.listHeight

            Rectangle {
                width: parent.width
                height: parent.height
                color: MyStyles.backgroundColor

                Text {
                    text: model.spo2Label + ": " + model.spo2Data + " [%]"
                    color: MyStyles.fontColor
                    font.pixelSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                Text {
                    text: model.prLabel + ": " + model.prData + " [bpm]"
                    color: MyStyles.fontColor
                    font.pixelSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 150
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
