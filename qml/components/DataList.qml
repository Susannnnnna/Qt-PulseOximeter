import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0
import "../components"

ListView {
    id: dataList
    anchors.fill: parent
//    width: parent.width
//    height: parent.height

    property var addDataDialog
    property var editDataDialog
    property var deleteDataDialog
    property var dataModel: ListModel
    property string deleteIcon: "qrc:/assets/icons/delete2.png"

    signal editData(int itemId, string item1, string item2)

    function findDataIndexById(itemId) {
        for (var i = 0; i < dataModel.count; i++) {
            if (dataModel.get(i).id === itemId) {
                return i;
            }
        }
        return -1;
    }

    model: dataModel

    delegate: SwipeDelegate {
        width: parent.width
        height: MyStyles.listHeight

        Rectangle {
            width: parent.width
            height: parent.height
            color: MyStyles.backgroundColor

            // Text left aligned (first field)
            Text {
                text: model.item1 ? model.item1 : "N/A"
                color: MyStyles.fontColor
                font.pixelSize: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 5
            }

            // Text right aligned (second field)
            Text {
                text: model.item2 ? model.item2 : "N/A"
                color: MyStyles.fontColor
                font.pixelSize: 16
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottomMargin: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("[DataList.qml] model.itemId:", model.itemId, "model.item1:", model.item1, "model.item2:", model.item2);
                    dataList.editData(model.itemId, model.item1, model.item2);
                    if (editDataDialog) {
                        console.log("[DataList.qml] Opening edit dialog for ID: ", model.itemId);
                        editDataDialog.selectedDataId = model.itemId;
                        editDataDialog.visible = true;
                        editData(model.itemId, model.item1, model.item2);
                    } else {
                        console.log("[DataList.qml] Error: editDataDialog is undefined.");
                    }
                }
            }
        }

        Rectangle {
            width: MyStyles.iconWidth * 2
            height: parent.height
            color: MyStyles.backgroundColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

            Image {
                source: deleteIcon
                width: MyStyles.iconWidth / 2
                height: MyStyles.iconHeight / 2
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deleteDataDialog.selectedDataId = model.itemId;
                    deleteDataDialog.open();
                    itemDeleted(model.itemId);
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
}
