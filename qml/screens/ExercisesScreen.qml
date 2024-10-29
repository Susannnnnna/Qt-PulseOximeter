import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: exerciseScreen
    anchors.fill: parent

    // *** PROPERTIES ***
    property int selectedDataId: -1
    property string textExerciseDate: "Exercise date"
    property string textExercise: "Exercise"

    // *** CONNECTIONS ***
    Connections {
        target: exercisesListModel
        function onDataChanged() {
            exercisesList.forceLayout();
        }
    }

    // *** FUNCTIONS ***
    function isValidDateformat(dateString) {
        // Regular expression checking format "YYYY-MM-DD HH:MM"
        var datePattern = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/;
        return datePattern.test(dateString);
    }

    function addRecord(userId, exerciseDate, exercise) {
        if (!isValidDateformat(exerciseDate)) {
            errorExerciseDialog.visible = true;
            return;
        }
        exercisesController.addExercise("user test", exerciseDate, exercise);
        selectedDataId = -1;
    }

    function editRecordById(id, exerciseDate, exercise) {
        if (!isValidDateformat(exerciseDate)) {
            errorExerciseDialog.visible = true;
            return;
        }
        exercisesController.editExercise(id, exerciseDate.toString(), exercise);
        exercisesController.getExercises();
    }

    function deleteRecordById(id, exercise) {
        exercisesController.deleteExercise(id, exercise);
    }


    // *** SCREEN CREATING ***
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of data
    DataList {
        id: exercisesList
        width: parent.width
        height: parent.height
        dataModel: exercisesListModel
        addDataDialog: addExerciseDialog
        editDataDialog: editExerciseDialog
        deleteDataDialog: deleteExerciseDialog

        onEditData: (itemId, item1, item2) => {
            selectedDataId = itemId;
            editExerciseDialog.selectedDataId = itemId;
            editExerciseDialog.firstFieldInput = item1;
            editExerciseDialog.secondFieldInput = item2;
            editExerciseDialog.visible = true;
        }

        Component.onCompleted: {
            exercisesController.getExercises()
        }
    }

    // ADD button
    AddButton {
        addDataDialog: addExerciseDialog
    }

    // ADD dialog
    AddDialog {
        id: addExerciseDialog
        buttonText: MyStyles.buttonTextAdd
        firstFieldLabel: textExerciseDate
        secondFieldLabel: textExercise
        onConfirmAction: function(exerciseDate, exercise) {
            exerciseScreen.addRecord("user test", exerciseDate, exercise);
            addExerciseDialog.close();
        }
    }

    // EDIT dialog
    EditDialog {
        id: editExerciseDialog
        buttonText: MyStyles.buttonTextSave
        firstFieldLabel: textExerciseDate
        secondFieldLabel: textExercise
        onConfirmAction: function(id, exerciseDate, exercise) {
            exerciseScreen.editRecordById(exerciseScreen.selectedDataId, exerciseDate, exercise);
            editExerciseDialog.close();
        }
    }

    // Confirm DELETE dialog for
    ConfirmDeleteDialog {
        id: deleteExerciseDialog
        itemTextLabel: "exercise"
        itemDataLabel: exercise // POPRAWIĆ POTEM TAK, ŻEBY ZWRACAŁO NAZWĘ POSIŁKU!!!
        onDeleteConfirmed: exerciseScreen.deleteRecordById
    }

    // ERROR dialog with validation information
    ErrorDialog {
        id: errorExerciseDialog
    }
}
