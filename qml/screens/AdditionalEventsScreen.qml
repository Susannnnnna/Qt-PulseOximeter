import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyStyles 1.0 //singleton
import "../components"

Page {
    id: additionalEventScreen
    anchors.fill: parent

    // *** PROPERTIES ***
    property int selectedDataId: -1
    property string textAdditionalEventDate: "Event date"
    property string textAdditionalEvent: "Event"

    // *** CONNECTIONS ***
    Connections {
        target: additionalEventsListModel
        function onDataChanged() {
            additionalEventsList.forceLayout();
        }
    }

    // *** FUNCTIONS ***
    function isValidDateformat(dateString) {
        // Regular expression checking format "YYYY-MM-DD HH:MM"
        var datePattern = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/;
        return datePattern.test(dateString);
    }

    function addRecord(userId, additionalEventDate, additionalEvent) {
        if (!isValidDateformat(additionalEventDate)) {
            errorDialog.visible = true;
            return;
        }
        additionalEventsController.addAdditionalEvent("user test", additionalEventDate, additionalEvent);
        selectedDataId = -1;
    }

    function editRecordById(id, additionalEventDate, additionalEvent) {
        if (!isValidDateformat(additionalEventDate)) {
            errorDialog.visible = true;
            return;
        }
        additionalEventsController.editAdditionalEvent(id, additionalEventDate.toString(), additionalEvent);
        additionalEventsController.getAdditionalEvents();
    }

    function deleteRecordById(id, additionalEvent) {
        additionalEventsController.deleteAdditionalEvent(id, additionalEvent);
    }


    // *** SCREEN CREATING ***
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    // List of data
    DataList {
        id: additionalEventsList
        width: parent.width
        height: parent.height
        dataModel: additionalEventsListModel
        addDataDialog: addDialog
        editDataDialog: editDialog
        deleteDataDialog: deleteDialog

        onEditData: (itemId, item1, item2) => {
            selectedDataId = itemId;
            editDialog.selectedDataId = itemId;
            editDialog.firstFieldInput = item1;
            editDialog.secondFieldInput = item2;
            editDialog.visible = true;
        }

        Component.onCompleted: {
            additionalEventsController.getAdditionalEvents()
        }
    }

    // ADD button
    AddButton {
        addDataDialog: addDialog
    }

    // ADD dialog
    AddDialog {
        id: addDialog
        buttonText: MyStyles.buttonTextAdd
        firstFieldLabel: textAdditionalEventDate
        secondFieldLabel: textAdditionalEvent
        onConfirmAction: function(additionalEventDate, additionalEvent) {
            additionalEventScreen.addRecord("user test", additionalEventDate, additionalEvent);
            addDialog.close();
        }
    }

    // EDIT dialog
    EditDialog {
        id: editDialog
        buttonText: MyStyles.buttonTextSave
        firstFieldLabel: textAdditionalEventDate
        secondFieldLabel: textAdditionalEvent
        onConfirmAction: function(id, additionalEventDate, additionalEvent) {
            additionalEventScreen.editRecordById(additionalEventScreen.selectedDataId, additionalEventDate, additionalEvent);
            editDialog.close();
        }
    }

    // Confirm DELETE dialog for
    ConfirmDeleteDialog {
        id: deleteDialog
        itemTextLabel: "event"
        itemDataLabel: additionalEvent // POPRAWIĆ POTEM TAK, ŻEBY ZWRACAŁO NAZWĘ POSIŁKU!!!
        onDeleteConfirmed: additionalEventScreen.deleteRecordById
    }

    // ERROR dialog with validation information
    ErrorDialog {
        id: errorDialog
    }
}
