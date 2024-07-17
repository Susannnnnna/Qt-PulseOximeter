import QtQuick 2.0
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480

    Rectangle {
        width: 640
        height: 480

        Component {
            id: listComponent

            Item {
                width: 180
                height: 200

                Column {
                    Text { text: '<b>SpO2:</b> ' + spo2 }
                    Text { text: '<b>Pulse:</b> ' + pulse }
                    Text { text: '<b>Blood pressure:</b> ' + bloodPressure }
                    Text { text: '<b>Blood glucose level:</b> ' + bloodGlucoseLevel }
                    Text { text: '<b>Blood glucose measurement details:</b> ' + bloodGlucoseMeasurementDetails }
                    Text { text: '<b>Time stamp:</b> ' + timeStamp }
                    Text { text: '<b>Date stamp:</b> ' + dateStamp }
                }
            }
        }

        ListModel {
            id: electronicDeviceData

            ListElement {
                spo2: "97 %"
                pulse: "60 beats per minute"
                bloodPressure: "120/80 mmHg" // 120 - skurczowe; 80 - rozkurczowe
                bloodGlucoseLevel: "120 mg/dL"
                bloodGlucoseMeasurementDetails: "2 hours aftres meal" // or "fasting (8 hours without eating)"
                timeStamp: "16:28"
                dateStamp: "2024-07-06"
            }
        }

        ListView {
            anchors.fill: parent
            model: electronicDeviceData
            delegate: listComponent
            highlight: Rectangle { color: "lightseelblue"; radius: 5 }
            focus: true
        }
    }
}
