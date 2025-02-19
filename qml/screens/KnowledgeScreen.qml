import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyStyles //singleton
import "../components"
Page {
    id: page
    anchors.fill: parent
    background: parent
    property alias loader: detailLoader
    property string detailsScreenPath: "KnowledgeDetailScreen.qml"
    property string textFilePath1: "qrc:/assets/text_files/test.html"
    property string textFilePath2: ""
    property string textFilePath3: ""
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Column {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            anchors.topMargin: 20
            Text {
                text: "Header 1"
                font.pixelSize: 16
                font.bold: true
                color: "black"
                anchors.left: parent.left
            }
            KnowledgeButton {
                buttonText: "Wiedza 1"
                onClicked: {
                    stackView.push(detailsScreenPath)
                    page.loader.onLoaded = function() {
                        page.loader.item.loadTextFromFile(page.textFilePath1)
                    }
                }
            }
            KnowledgeButton {
                buttonText: "Wiedza 2"
                onClicked: {
                    stackView.push(detailsScreenPath)
                    page.loader.onLoaded = function() {
                        page.loader.item.loadTextFromFile(page.textFilePath1)
                    }
                }
            }
            KnowledgeButton {
                buttonText: "Wiedza 3"
                onClicked: {
                    stackView.push(detailsScreenPath)
                    page.loader.onLoaded = function() {
                        page.loader.item.loadTextFromFile(page.textFilePath1)
                    }
                }
            }
        }
        Loader {
            id: detailLoader
            anchors.fill: parent
            asynchronous: true
        }
    }
}
