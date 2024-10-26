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
