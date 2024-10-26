<<<<<<< HEAD
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: mainPage
    anchors.fill: parent

    function findMealIndexById(mealId) {
        for (var i = 0; i < mealsModel.count; i++) {
            if (mealsModel.get(i).id === mealId) {
                return i;
            }
        }
        return -1;
    }

    // Icons paths
    property string addIcon: "qrc:/assets/icons/add.png"
    property string deleteIcon: "qrc:/assets/icons/delete2.png"
    property string warningIcon: "qrc:/assets/icons/warning.png"

    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // ListView - data rows
    ListView {
        id: mealsList
        width: parent.width
        height: parent.height
        model: ListModel {
            id: mealsModel
        }

        delegate: SwipeDelegate {
            width: parent.width
            height: MyStyles.listHeight

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: MyStyles.backgroundColor

                    // Text left aligned (meal date)
                    Text {
                        text: model.meal_date
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                    }

                    // Text right aligned (meal)
                    Text {
                        text: model.meal
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 100
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editMealDialog.open()
                            editMealDateField.text = model.meal_date
                            editMealField.text = model.meal
                            editMealDialog.selectedMealId = model.id
                        }
                    }
                }

                // Delete record
                Rectangle {
                    width: MyStyles.iconWidth * 2
                    height: parent.height
                    color: MyStyles.backgroundColor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Image {
                        source: deleteIcon
                        width: MyStyles.iconWidth / 2
                        height: MyStyles.iconHeight / 2
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            confirmDeleteDialog.selectedMealId = model.id;
                            confirmDeleteDialog.open();
                            }
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

        Component.onCompleted: {
            var meals = mealsController.getMeals();
            mealsModel.clear();
            for (var i = 0; i < meals.length; ++i) {
                console.log("Meal: ", meals[i]);
                mealsModel.append(meals[i]);
            }
        }
    }

    // Button opens dialog box - add data
    Button {
        id: buttonAdd
        width: MyStyles.buttonWidth
        height: MyStyles.buttonHeight
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 40
        anchors.bottomMargin: 40

        // Disable effect while clicking the button
        hoverEnabled: false
        highlighted: false

        background: Rectangle {
            color: MyStyles.buttonColor
        }
        Image {
            source: addIcon
            width: MyStyles.iconWidth
            height: MyStyles.iconHeight
            anchors.centerIn: parent
        }
//        contentItem: Text {
//            text: MyStyles.buttonTextAdd
//            color: MyStyles.buttonTextColor
//            font.pointSize: MyStyles.buttonTextFontSize
//            //anchors.centerIn: parent
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//        }
        onClicked: addMealDialog.open()
    }

    Dialog {
        id: confirmDeleteDialog
        modal: true
        visible: false
        x: (parent.width - background.width) / 2
        y: (parent.height - background.height) / 2

        property int selectedMealId: -1

        background: Rectangle {
            color: "white"
            width: 200
            height: 175
            radius: 10
            border.color: "#FFD700" //yellow type
            border.width: 2
        }

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Image {
                source: warningIcon
                width: 35
                height: 35
            }

            Label {
                text: "Are you sure you want \nto delete this meal?"
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 16
            }

            Button {
                text: "OK"
                anchors.right: parent.right
                hoverEnabled: false
                font.pixelSize: 16
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }

                onClicked: {
                    if (confirmDeleteDialog.selectedMealId >= 0) {
                        var index = findMealIndexById(confirmDeleteDialog.selectedMealId);
                        if (index >= 0) {
                            mealsController.deleteMeal(confirmDeleteDialog.selectedMealId);
                            mealsModel.remove(index);
                        }
                        confirmDeleteDialog.close();
                    }
                }
            }
        }
    }

    // Dialog box to add a new meal
    Dialog {
        id: addMealDialog
        modal: true
        visible: false
        x: 0
        y: (parent.height - background.height) / 2

        background: Rectangle {
            color: "white"
            width: mealsList.width
            height: 210
            radius: 10
        }

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Label {
                text: "Date"
                font.pixelSize: 12
            }

            // Transparent space to center
            Rectangle {
                width: mealsList.width
                height: 2
                color: "transparent"
            }

            TextField {
                id: addMealDateField
                placeholderText: "RRRR-MM-DD HH:MM"
                background: Rectangle {
                    color: "transparent"
                }
                font.pixelSize: 14
                bottomPadding: 1
                Rectangle {
                    height: 0.5
                    width: mealsList.width * 0.80
                    color: "lightgray"
                    anchors.bottom: parent.bottom
                }
            }

            Label {
                text: "Meal description"
                font.pixelSize: 12
            }

            // Transparent space to center
            Rectangle {
                width: mealsList.width
                height: 1
                color: "transparent"
            }

            TextField {
                id: addMealField
                background: Rectangle {
                    color: "transparent"
                }
                font.pixelSize: 14
                bottomPadding: 1
                Rectangle {
                    height: 0.5
                    width: mealsList.width * 0.80
                    color: "lightgray"
                    anchors.bottom: parent.bottom
                }
            }

            Button {
                text: MyStyles.buttonTextAdd
                anchors.verticalCenter: addMealDialog.verticalCenter
                anchors.right: addMealDialog.right
                hoverEnabled: false
                font.pixelSize: 14
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }

                onClicked: {
                    var mealDate = addMealDateField.text;
                    var meal = addMealField.text;
                    mealsController.addMeal("testUser", mealDate, meal);

                    var newMeal = {
                        "id": mealsModel.count + 1, // Assumed that ID is generated automatically
                        "user_id": "testUser",
                        "meal_date": mealDate,
                        "meal": meal,
                        "create_stamp": new Date().toISOString(),
                        "modify_stamp": new Date().toISOString()
                    };
                    mealsModel.append(newMeal);
                    addMealDialog.close();

                    // Clear fields after adding
                    mealDateField.text = "";
                    mealField.text = "";
                }
            }
        }
    }

    // Dialog box to edit meals
    Dialog {
        id: editMealDialog
        modal: true
        visible: false
        x: 0
        y: (parent.height - background.height) / 2

        property int selectedMealId: -1

        background: Rectangle {
            color: "white"
            width: mealsList.width
            height: 210
            radius: 10
        }

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Label {
                text: "Date"
                font.pixelSize: 12
            }

            // Transparent space to center
            Rectangle {
                width: mealsList.width
                height: 2
                color: "transparent"
            }

            TextField {
                id: editMealDateField
                placeholderText: "RRRR-MM-DD HH:MM"
                background: Rectangle {
                    color: "transparent"
                }
                font.pixelSize: 14
                bottomPadding: 1
                Rectangle {
                    height: 0.5
                    width: mealsList.width * 0.80
                    color: "lightgray"
                    anchors.bottom: parent.bottom
                }
            }

            Label {
                text: "Meal description"
                font.pixelSize: 12
            }

            // Transparent space to center
            Rectangle {
                width: mealsList.width
                height: 1
                color: "transparent"
            }

            TextField {
                id: editMealField
                background: Rectangle {
                    color: "transparent"
                }
                font.pixelSize: 14
                bottomPadding: 1
                Rectangle {
                    height: 0.5
                    width: mealsList.width * 0.80
                    color: "lightgray"
                    anchors.bottom: parent.bottom
                }
            }

            Button {
                text: MyStyles.buttonTextSave
                anchors.verticalCenter: editMealDialog.verticalCenter
                anchors.right: editMealDialog.right
                hoverEnabled: false
                font.pixelSize: 14
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }

                onClicked: {
                    var newMealDate = editMealDateField.text;
                    var newMeal = editMealField.text;

                    if (newMealDate === "" || newMeal === "") {
                        console.log("Date or meal is missing");
                    } else {
                        mealsController.editMeal(
                            editMealDialog.selectedMealId,
                            newMealDate,
                            newMeal);
                        var index = findMealIndexById(editMealDialog.selectedMealId);
                        if (index >= 0) {
                            mealsModel.set(index, {"id":editMealDialog.selectedMealId, "meal_date": newMealDate, "meal": newMeal});
                            editMealDialog.close();

                        }
                    }
                }
            }
        }
    }
}
=======
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
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
