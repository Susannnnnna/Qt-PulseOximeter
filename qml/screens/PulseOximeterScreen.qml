import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyStyles //singleton

Page {
    id: page
    anchors.fill: parent
    background: parent

    property int topMaring: 70

    Button {
        anchors.centerIn: parent
        width: 250
        height: 250

        hoverEnabled: false
        highlighted: false

        background: Rectangle {
            color: "#292929" // black type
            border.color: "black"
            border.width: 3
            radius: 250
        }

        Text {
            text: "Measurement time"
            font.pixelSize: 12
            font.bold: false
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: topMaring - 45
        }

        Text {
            text: "2024-10-10 10:00"
            font.pixelSize: 12
            font.bold: false
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: topMaring - 30
        }

        Row {
            anchors.fill: parent
            anchors.margins: 10

            Text {
                text: "SpO2 [%]"
                font.pixelSize: 20
                font.bold: true
                color: "#007fff" // blue type
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: topMaring
            }

            Text {
                text: "PR [bpm]"
                font.pixelSize: 20
                font.bold: true
                color: "#ffff99" // yellow type
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: topMaring
            }
        }

        Row {
            anchors.fill: parent
            anchors.margins: 10

            Text {
                text: "99"
                font.pixelSize: 50
                font.bold: true
                color: "white"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: topMaring
            }

            Text {
                text: "98"
                font.pixelSize: 50
                font.bold: true
                color: "white"
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: topMaring
            }
        }

        onClicked: { stackView.push("PulseOximeterDetailScreen.qml") }
    }
}
