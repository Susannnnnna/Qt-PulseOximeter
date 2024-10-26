import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: mealScreen
    anchors.fill: parent

    property int selectedDataId: -1

    function addRecord(userId, mealDate, meal) {
        console.log("Adding record:", mealDate, meal);
        mealsController.addMeal("user test", mealDate, meal);
        selectedDataId = -1;
        console.log("Add record result:", result);
    }

    function editRecordById(id, mealDate, meal) {
        console.log("Edit record with ID: ", id);
        console.log("Editing record data: ", id, mealDate, meal);
        mealsController.editMeal(id, mealDate, meal);
        selectedDataId = -1;
    }

    function deleteRecordById(id) {
        mealsController.deleteMeal(id);
    }

    Connections {
        target: mealsListModel
        function onDataChanged() {
            console.log("Data changed in mealsListModel");
            mealsList.forceLayout();
        }
    }

    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of meals - OK
    DataList {
        id: mealsList
        dataModel: mealsListModel
        addDataDialog: addMealDialog
        editDataDialog: editMealDialog
        deleteDataDialog: deleteMealDialog

        Component.onCompleted: {
            mealsController.getMeals()
            console.log("DataList model: ", dataModel);
        }
    }

    // ADD button for meals
    AddButton {
        addDataDialog: addMealDialog
    }

    // ADD meal dialog - OK
    AddDialog {
        id: addMealDialog
        buttonText: MyStyles.buttonTextAdd
        firstField: "Date"
        secondField: "Meal"
        onConfirmAction: function(mealDate, meal) {
            mealScreen.addRecord("user test", mealDate, meal);
        }
    }

    // EDIT meal dialog
    EditDialog {
        id: editMealDialog
        buttonText: MyStyles.buttonTextSave
        firstField: "Date"
        secondField: "Meal"
        onConfirmAction: function(id, mealDate, meal) {
            mealScreen.editRecordById(mealScreen.selectedDataId, mealDate, meal);
        }
    }

    // Confirm DELETE dialog for meals - OK
    ConfirmDeleteDialog {
        id: deleteMealDialog
        itemTextLabel: "meal"
        onDeleteConfirmed: mealScreen.deleteRecordById
    }
}
