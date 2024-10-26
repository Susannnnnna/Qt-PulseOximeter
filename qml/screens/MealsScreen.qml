import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: mealScreen
    anchors.fill: parent

    function addRecord(userId, mealDate, meal) {
        console.log("Adding record:", mealDate, meal);
        mealsController.addMeal("user_id", mealDate, meal)
    }

    function editRecordById(id, mealDate, meal) {
        console.log("Editing record:", id, mealDate, meal);
        mealsController.editMeal(id, mealDate, meal)
    }

    function deleteRecordById(id) {
        mealsController.deleteMeal(id);
    }

    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of meals - OK
    DataList {
        id: mealsList
        dataModel: mealsListModel
        editDataDialog: addMealDialog

        Component.onCompleted: {
            mealsController.getMeals()
        }

        deleteDataDialog: deleteMealDialog

//        onItemClicked: {
//            addEditMealDialog.selectedDataId = itemId;
//            addEditMealDialog.firstFieldInput.text = item1;
//            addEditMealDialog.secondFieldInput.text = item2;
//            addEditMealDialog.visible = true;
//        }
    }

    // ADD button for meals
    AddButton {
        addDataDialog: addMealDialog
    }

    // ADD meal dialog
    AddOrEditDialog {
        id: addMealDialog
        buttonText: MyStyles.buttonTextAdd
        firstField: "Date"
        secondField: "Meal"
        onConfirmAction: mealsScreen.selectedDataId === -1 ? mealScreen.addRecord : mealScreen.editRecordById
    }

    // Confirm DELETE dialog for meals - OK
    ConfirmDeleteDialog {
        id: deleteMealDialog
        itemTextLabel: "meal"
        onDeleteConfirmed: mealScreen.deleteRecordById
    }
}
