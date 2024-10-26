// https://wiki.qt.io/Qml_Styling
// https://forum.qt.io/topic/93040/qml-problem-with-using-data-from-other-qml-file-referenceerror-theme-is-not-defined
import QtQuick

// Populate the model with some sample data.
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
