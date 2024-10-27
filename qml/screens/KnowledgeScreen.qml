import QtQuick
import QtQuick.Controls
import MyStyles //singleton
import "../components"

Page {
    anchors.fill: parent
    background: parent

    property string rightArrowIcon: "assets/icons/right-arrow-angle.png"

    ListView {
        id: knowledgeList
        anchors.fill: parent

        model: ListModel {
            ListElement { description: "Knowledge 1" }
            ListElement { description: "Knowledge 2" }
            ListElement { description: "Knowledge 3" }
            ListElement { description: "Knowledge 4" }
            ListElement { description: "Knowledge 5" }
        }

        delegate: SwipeDelegate {
            width: parent.width
            height: MyStyles.listHeight

            Rectangle {
                width: parent.width
                height: parent.height
                color: MyStyles.backgroundColor

                Text {
                    text: model.label
                    color: MyStyles.fontColor
                    font.pixelSize: 16
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                Image {
                    source: rightArrowIcon
                    width: 35
                    height: 35
                    x: knowledgeList.width - 100
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
