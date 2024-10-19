import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property var model

//    ListModel {
//        id: listModel
//        ListElement {
//            spo2: "97 %"
//            pulse: "60 beats per minute"
//            bloodPressure: "120/80 mmHg" // 120 - skurczowe; 80 - rozkurczowe
//            bloodGlucoseLevel: "120 mg/dL"
//            bloodGlucoseMeasurementDetails: "2 hours aftres meal" // or "fasting (8 hours without eating)"
//            timeStamp: "16:28"
//            dateStamp: "2024-07-06"
//        }
//    }

    ListView {
        id: listView
        anchors.fill: parent
        model: root.model
        delegate: SwipeDelegate {
            width: listView.width
            spacing: 0

            contentItem: Item {
                width: parent.width
                height: 50

                Button {
                    id: button
                    text: model.spo2
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked on " + model.spo2)
                    }
                }
            }

            background: RowLayout {
                anchors.fill: parent

                Item {
                    Layout.fillWidth:  true
                }

                Button {
                    text: "Delete"
                    onClicked: {
                        root.model.remove(index)
                    }
                }
            }

            onReleased: {
                if (Math.abs(swipe.target.x) > swipeArea.width / 2) {
                    console.log("Swiped " + model.spo2)
                }
            }
        }
    }
}
