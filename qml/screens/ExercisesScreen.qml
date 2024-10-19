import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    anchors.fill: parent
    background: parent

    ListView {
        id: listView
        anchors.fill: parent

        model: ListModel {
            ListElement { itemId: "first"; name: "2024-08-21"; selectedOption: "Workout 1" }
            ListElement { itemId: "second"; name: "2024-08-22"; selectedOption: "Workout 2" }
            ListElement { itemId: "third"; name: "2024-08-23"; selectedOption: "Workout 3" }
            ListElement { itemId: "fourth"; name: "2024-08-24"; selectedOption: "Workout 4" }
        }
    }
}
