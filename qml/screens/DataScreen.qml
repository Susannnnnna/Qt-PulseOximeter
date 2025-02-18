pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"
import "../styles"

Page {
    id: dataScreen
    anchors.fill: parent
    background: parent

    ListView {
        id: pulseListView
        anchors.fill: parent

        model: ListModel {
            ListElement { pulseValue: "x60"; hrvValue: "x70"; timeStamp: "mm2025" }
            ListElement { pulseValue: "x59"; hrvValue: "x72"; timeStamp: "mm2025" }
            ListElement { pulseValue: "x61"; hrvValue: "x73"; timeStamp: "mm2025" }
        }

        header: Rectangle {
            height: 40
            width: parent.width
            color: MyStyles.cardsBackgroundColor

            RowLayout {
                anchors.fill: parent

                Text {
                    text: qsTr("Pulse [bpm]")
                    font.pixelSize: MyStyles.fontSize
                    color: MyStyles.backgroundColor
                    Layout.preferredWidth: pulseListView.width * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    text: qsTr("HRV [ms]")
                    font.pixelSize: MyStyles.fontSize
                    color: MyStyles.backgroundColor
                    Layout.preferredWidth: pulseListView.width * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    text: qsTr("Time [s]")
                    font.pixelSize: MyStyles.fontSize
                    color: MyStyles.backgroundColor
                    Layout.preferredWidth: pulseListView.width * 0.2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            LineSeparator { lineHeight: 0.5; lineColor: "#99FFFF" }
        }

        delegate: Rectangle {
            height: 40
            width: parent.width
            color: MyStyles.cardsBackgroundColor

            RowLayout {
                anchors.fill: parent

                Text {
                    text: model.pulseValue
                    color: MyStyles.backgroundColor
                    //Layout.preferredWidth: pulseListView.width * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    text: model.hrvValue
                    color: MyStyles.backgroundColor
                    Layout.preferredWidth: pulseListView.width * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    text: model.timeStamp
                    color: MyStyles.backgroundColor
                    Layout.preferredWidth: pulseListView.width * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            LineSeparator { lineHeight: 0.5; lineColor: "#99FFFF" }
        }
    }
}
