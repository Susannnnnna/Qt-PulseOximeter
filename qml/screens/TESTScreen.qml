import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: mainPage
    anchors.fill: parent
    title: "Measurements"

    Label {
        text: "Test"
        anchors.centerIn: parent
    }

    Image {
        source: "qrc:/assets/icons/equal.png"  // Ścieżka do zasobu
        width: 64  // Szerokość ikony
        height: 64  // Wysokość ikony
        anchors.centerIn: parent
    }

//    // Używamy MeasurementController zarejestrowanego w main.cpp
//    ColumnLayout {
//        anchors.fill: parent
//        spacing: 10

//        // Nagłówki kolumn
//        RowLayout {
//            spacing: 10
//            Rectangle {
//                width: 50
//                height: 40
//                color: "lightgray"
//                Text {
//                    text: "ID"
//                    anchors.centerIn: parent
//                }
//            }
//            Rectangle {
//                width: 100
//                height: 40
//                color: "lightgray"
//                Text {
//                    text: "SpO2"
//                    anchors.centerIn: parent
//                }
//            }
//            Rectangle {
//                width: 100
//                height: 40
//                color: "lightgray"
//                Text {
//                    text: "Heart Rate"
//                    anchors.centerIn: parent
//                }
//            }
//            Rectangle {
//                width: 150
//                height: 40
//                color: "lightgray"
//                Text {
//                    text: "Timestamp"
//                    anchors.centerIn: parent
//                }
//            }
//        }

//        // ListView - wiersze danych
//        ListView {
//            id: measurementsList
//            width: parent.width
//            height: parent.height * 0.7
//            model: ListModel {
//                id: measurementsModel
//            }

//            delegate: RowLayout {
//                spacing: 10
//                Rectangle {
//                    width: 50
//                    height: 40
//                    color: "white"
//                    border.color: "black"
//                    Text {
//                        text: model.id
//                        anchors.centerIn: parent
//                    }
//                }
//                Rectangle {
//                    width: 100
//                    height: 40
//                    color: "white"
//                    border.color: "black"
//                    Text {
//                        text: model.spo2
//                        anchors.centerIn: parent
//                    }
//                }
//                Rectangle {
//                    width: 100
//                    height: 40
//                    color: "white"
//                    border.color: "black"
//                    Text {
//                        text: model.heart_rate
//                        anchors.centerIn: parent
//                    }
//                }
//                Rectangle {
//                    width: 150
//                    height: 40
//                    color: "white"
//                    border.color: "black"
//                    Text {
//                        text: model.timestamp
//                        anchors.centerIn: parent
//                    }
//                }
//            }

//            Component.onCompleted: {
//                var measurements = measurementController.getMeasurements();
//                measurementsModel.clear();
//                for (var i = 0; i < measurements.length; ++i) {
//                    measurementsModel.append(measurements[i]);
//                }
//            }
//        }

//        Row {
//            spacing: 10
//            Button {
//                text: "Add"
//                onClicked: addMeasurementDialog.open()
//            }
//            Button {
//                text: "Delete"
//                onClicked: {
//                    var selected = measurementsList.currentIndex;
//                    if (selected >= 0) {
//                        var id = measurementsModel.get(selected).id;
//                        measurementController.removeMeasurement(id);
//                        measurementsModel.remove(selected);
//                    }
//                }
//            }
//        }
//    }

//    // Okno dialogowe do dodawania nowego pomiaru
//    Dialog {
//        id: addMeasurementDialog
//        title: "Add Measurement"
//        modal: true
//        visible: false

//        Column {
//            spacing: 10
//            Label { text: "SpO2" }
//            TextField { id: spo2Field; placeholderText: "Enter SpO2 value" }

//            Label { text: "Heart Rate" }
//            TextField { id: heartRateField; placeholderText: "Enter Heart Rate value" }

//            Button {
//                text: "Add"
//                onClicked: {
//                    var spo2 = parseFloat(spo2Field.text);
//                    var heartRate = parseFloat(heartRateField.text);
//                    measurementController.addMeasurement(spo2, heartRate);

//                    var newMeasurement = {
//                        "id": measurementsModel.count + 1, // Zakładamy, że ID jest generowane automatycznie
//                        "spo2": spo2,
//                        "heart_rate": heartRate,
//                        "timestamp": new Date().toISOString()
//                    };
//                    measurementsModel.append(newMeasurement);
//                    addMeasurementDialog.close();
//                }
//            }
//        }
//    }
}
