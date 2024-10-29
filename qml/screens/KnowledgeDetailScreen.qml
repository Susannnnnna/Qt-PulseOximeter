import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml 2.15
import Qt.labs.settings 1.0
import MyStyles //singleton
import "../components"

Page {
    id: detailScreen
    anchors.fill: parent
    background: parent

    signal requestLoadTextFromFile(string filePath)

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Nie działa... NAPRAWIĆ!"
            font.pixelSize: 16
            font.bold: true
            color: "black"
            anchors.left: parent.left
        }

        TextArea {
            id: textArea
            readOnly: true
            width: parent.width * 0.9
            height: parent.height * 0.7
            font.pixelSize: 16
            color: "black"
            textFormat: TextEdit.RichText

            background: Rectangle {
                color: "transparent"
            }
        }
    }

    Component.onCompleted: {
        var file = Qt.resolvedUrl(filePath);
        var xhr = new XMLHttpRequest();
        xhr.open("GET", file, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    textArea.text = xhr.responseText; // Show HTML
                } else {
                    textArea.text = "Nie udało się załadować pliku.";
                }
            }
        }
        xhr.send();
    }
}
