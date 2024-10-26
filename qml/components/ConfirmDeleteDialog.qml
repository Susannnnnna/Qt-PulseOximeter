import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0

Dialog {
    id: confirmDeleteDialog
    modal: true
    visible: false
    x: (parent.width - background.width) / 2
    y: (parent.height - background.height) / 2

    property string itemTextLabel: ""
    property var dataController
    property var dataModel
    property int selectedDataId: -1
    property string warningIcon: "qrc:/assets/icons/warning.png"

    function findDataIndexById(dataId) {
        for (var i = 0; i < dataModel.count; i++) {
            if (dataModel.get(i).id === dataId) {
                return i;
            }
        }
        return -1;
    }

    background: Rectangle {
        color: "white"
        width: 200
        height: 175
        radius: 10
        border.color: "#FFD700" // yellow type
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
            x: confirmDeleteDialog.width - 100
        }

        Label {
            text: `Are you sure you want\nto delete this ${itemTextLabel}?`
            font.pixelSize: 16
        }

        Button {
            text: "OK"
            hoverEnabled: false
            font.pixelSize: 14
            x: confirmDeleteDialog.width - 50
            background: Rectangle {
                color: "#FFD700" // yellow type
                border.color: "black"
                border.width: 1
                radius: 4
            }

            onClicked: {
                if (confirmDeleteDialog.selectedDataId >= 0) {
                    var index = findDataIndexById(confirmDeleteDialog.selectedDataId);
                    if (index >= 0) {
                        dataController.deleteData(confirmDeleteDialog.selectedDataId);
                        dataModel.remove(index);
                    }
                    confirmDeleteDialog.visible = false;
                }
            }
        }
    }
}
