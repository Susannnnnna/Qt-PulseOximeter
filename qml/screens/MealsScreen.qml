<<<<<<< HEAD
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: mealScreen
    anchors.fill: parent

    function handleItemClicked(itemId, item1, item2) {
        openEditDialog(itemId, item1, item2);
    }

    function openEditDialog(itemId, item1, item2) {
        editMealDialog.selectedDataId = itemId
        editMealDialog.firstFieldInput.text = item1
        editMealDialog.secondFieldInput.text = item2
        editMealDialog.visible = true
    }

    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of meals
    DataList {
        id: mealsList
        dataModel: mealsListModel
        editDataDialog: editMealDialog
        deleteDataDialog: deleteMealDialog

        onItemClicked: handleItemClicked
        onItemDeleted: {
            deleteMealDialog.selectedDataId = itemId;
            deleteMealDialog.visible = true;
        }

        Component.onCompleted: {
            mealsController.getMeals()
        }
    }

    // Add button for meals
    AddButton {
        addDataDialog: addMealDialog
    }

    // Confirm delete dialog for meals
    ConfirmDeleteDialog {
        id: deleteMealDialog
        itemTextLabel: "meal"
        dataController: mealsController
        dataModel: mealsListModel
    }

    // Add meal dialog
    AddOrEditDialog {
        id: addMealDialog
        buttonText: MyStyles.buttonTextAdd
        firstField: "Date"
        secondField: "Meal"
    }

    // Edit meal dialog
    AddOrEditDialog {
        id: editMealDialog
        buttonText: MyStyles.buttonTextSave
        firstField: "Date"
        secondField: "Meal"
    }
}
=======
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0

Page {
    id: mainPage
    anchors.fill: parent

    // Icons paths
    property string addIcon: "qrc:/assets/icons/add.png"
    property string deleteIcon: "qrc:/assets/icons/delete2.png"

    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // ListView - data rows
    ListView {
        id: mealsList
        width: parent.width
        height: parent.height * 1
        model: ListModel {
            id: mealsModel
        }

        delegate: SwipeDelegate {
            width: parent.width
            height: MyStyles.listHeight
            Rectangle {
                width: MyStyles.listWidth
                height: MyStyles.listHeight
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
                    anchors.rightMargin: 10
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        editMealDialog.open()
                        editMealDateField.text = model.meal_date
                        editMealField.text = model.meal
                    }
                }
            }

            // Bottom-line after every row in the list
            Rectangle {
                width: parent.width * 0.95
                height: 1
                color: MyStyles.listBorderColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }

            // Deleting records
            Image {
                source: deleteIcon
                width: MyStyles.iconWidth / 2
                height: MyStyles.iconHeight / 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var index = model.index;
                        if (index >= 0) {
                            var id = mealsModel.get(index).id;
                            mealsController.deleteMeal(id);
                            mealsModel.remove(index);
                        }
                    }
                }
//                swipe.left: SwipeAction {
//                    text:"Delete"
//                    onTriggered: {
//                        var index = model.index;
//                        if (index >= 0) {
//                            var id = mealsModel.get(index).id;
//                            mealsController.deleteMeal(id);
//                            mealsModel.remove(index);
//                        }
//                    }
//                }
            }
        }

        Component.onCompleted: {
            var meals = mealsController.getMeals();
            mealsModel.clear();
            for (var i = 0; i < meals.length; ++i) {
                mealsModel.append(meals[i]);
            }
        }
    }

    // Button opens dialog box - add data
    Button {
        width: MyStyles.buttonWidth
        height: MyStyles.buttonHeight
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20

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

    // Dialog box to add a new meal
    Dialog {
        id: addMealDialog
        title: "New Meal"
        modal: true
        visible: false

        Column {
            spacing: 10
            Label { text: "Meal date" }
            TextField {
                id: mealDateField;
                placeholderText: "RRRR-MM-DD HH:MM"
            }

            Label { text: "Meal" }
            TextField {
                id: mealField;
            }

            Button {
                text: MyStyles.buttonTextAdd
                onClicked: {
                    var mealDate = mealDateField.text;
                    var meal = mealField.text;
                    mealsController.addMeal(mealDate, meal);

                    var newMeal = {
                        "id": mealsModel.count + 1, // Assumed that ID is generated automatically
                        "meal_date": mealDate,
                        "meal": meal,
                        "timestamp": new Date().toISOString()
                    };
                    mealsModel.append(newMeal);
                    addMealDialog.close();
                }
            }
        }
    }

    // Dialog box to edit meals
    Dialog {
        id: editMealDialog
        title: "Edit Meal"
        modal: true
        visible: false

        Column {
            spacing: 10
            Label { text: "Meal date" }
            TextField {
                id: editMealDateField
                placeholderText: "RRRR-MM-DD HH:MM"
            }

            Label { text: "Meal" }
            TextField {
                id: editMealField
            }

            Button {
                text: MyStyles.buttonTextSave
                onClicked: {
                    var selected = mealsList.currentIndex;
                    if (selected >= 0) {
                        var id = mealsModel.get(selected).id;
                        var newMealDate = Qt.formatDateTime(editMealDateField.text);
                        var newMeal = editMealField.text;

                        mealsController.editMeal(id, newMealDate, newMeal);

                        // Update data in model
                        mealsModel.set(selected, {"id":id, "meal_date": newMealDate, "meal": newMeal});
                        editMealDialog.close();
                    }
                }
            }
        }
    }
}
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
