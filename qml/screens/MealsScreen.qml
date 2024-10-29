import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: mealScreen
    anchors.fill: parent

    // *** PROPERTIES ***
    property int selectedDataId: -1
    property string textMealDate: "Meal date"
    property string textMeal: "Meal"

    // *** CONNECTIONS ***
    Connections {
        target: mealsController
        onErrorOccured: {
            console.error("[MealsScreen.qml] [Connections] System Error: ", errorMessage);
        }
    }

    Connections {
        target: mealsListModel
        function onDataChanged() {
            console.log("[MealsScreen.qml] [Connections] Data changed in mealsListModel");
            mealsList.forceLayout();
        }
    }

    // *** FUNCTIONS ***
    function isValidDateformat(dateString) {
        // Regular expression checking format "YYYY-MM-DD HH:MM"
        var datePattern = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/;
        return datePattern.test(dateString);
    }

    function addRecord(userId, mealDate, meal) {
        if (!isValidDateformat(mealDate)) {
            console.error("[MealsScreen.qml] [function addRecord] Invalid date format. Expected format: YYYY-MM-DD HH:MM");
            errorMealsDialog.visible = true;
            return;
        }

        console.log("[MealsScreen.qml] [function addRecord] Adding record:", mealDate, meal);
        mealsController.addMeal("user test", mealDate, meal);
        selectedDataId = -1;
        console.log("[MealsScreen.qml] [function addRecord] Add record result:", result);
    }

    function editRecordById(id, mealDate, meal) {
        if (!isValidDateformat(mealDate)) {
            console.error("[MealsScreen.qml] [function addRecord] Invalid date format. Expected format: YYYY-MM-DD HH:MM");
            errorMealsDialog.visible = true;
            return;
        }

        console.log("[MealsScreen.qml] [function editRecordById] editRecordById() called with id:", id, "mealDate:", mealDate, "meal:", meal);
        console.log("[MealsScreen.qml] [function editRecordById] Type of id:", typeof id, "Type of mealDate:", typeof mealDate.toString(), "Type of meal:", typeof meal);
        mealsController.editMeal(id, mealDate.toString(), meal);
        mealsController.getMeals();
    }

    function deleteRecordById(id, meal) {
        mealsController.deleteMeal(id, meal);
    }


    // *** SCREEN CREATING ***
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of meals - OK
    DataList {
        id: mealsList
        width: parent.width
        height: parent.height
        dataModel: mealsListModel
        addDataDialog: addMealsDialog
        editDataDialog: editMealsDialog
        deleteDataDialog: deleteMealsDialog

        onEditData: (itemId, item1, item2) => {
            selectedDataId = itemId;
            console.log("[MealsScreen.qml] [DataList] Opening edit dialog with details:",
                        itemId, ", Type:", typeof itemId,
                        item1, ", Type:", typeof item1,
                        item2, ", Type:", typeof item1);
            editMealsDialog.selectedDataId = itemId;
            editMealsDialog.firstFieldInput = item1;
            editMealsDialog.secondFieldInput = item2;
            editMealsDialog.visible = true;
            console.log("[MealsScreen.qml] [DataList] onEditData finished, print:",
                        editMealsDialog.selectedDataId,
                        editMealsDialog.firstFieldInput,
                        editMealsDialog.secondFieldInput);
        }

        Component.onCompleted: {
            mealsController.getMeals()
            console.log("[MealsScreen.qml] [DataList] DataList model: ", dataModel);
        }
    }

    // ADD button for meals
    AddButton {
        addDataDialog: addMealsDialog
    }

    // ADD meal dialog - OK
    AddDialog {
        id: addMealsDialog
        buttonText: MyStyles.buttonTextAdd
        firstFieldLabel: textMealDate
        secondFieldLabel: textMeal
        onConfirmAction: function(mealDate, meal) {
            mealScreen.addRecord("user test", mealDate, meal);
            addMealsDialog.close();
        }
    }

    // EDIT meal dialog - OK
    EditDialog {
        id: editMealsDialog
        buttonText: MyStyles.buttonTextSave
        firstFieldLabel: textMealDate
        secondFieldLabel: textMeal
        onConfirmAction: function(id, mealDate, meal) {
            mealScreen.editRecordById(mealScreen.selectedDataId, mealDate, meal);
            editMealsDialog.close();
            console.log("[MealsScreen.qml] [EditDialog] actions in edit dialog with:",
                        mealScreen.selectedDataId, mealDate, meal);
        }
    }

    // Confirm DELETE dialog for meals - OK
    ConfirmDeleteDialog {
        id: deleteMealsDialog
        itemTextLabel: "meal"
        itemDataLabel: meal // POPRAWIĆ POTEM TAK, ŻEBY ZWRACAŁO NAZWĘ POSIŁKU!!!
        onDeleteConfirmed: mealScreen.deleteRecordById
    }

    // ERROR dialog with validation information
    ErrorDialog {
        id: errorMealsDialog
    }
}
