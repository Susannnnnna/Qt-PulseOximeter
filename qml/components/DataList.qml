import QtQuick 2.15
import QtQuick.Controls 2.15
import MyStyles 1.0
import "../components"

ListView {
    id: dataList
    width: parent.width
    height: parent.height

    property var addDataDialog
    property var editDataDialog
    property var deleteDataDialog
    property var dataModel: ListModel
    property string deleteIcon: "qrc:/assets/icons/delete2.png"

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
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            // Text right aligned (second field)
            Text {
                text: model.item2 ? model.item2 : "N/A"
                color: MyStyles.fontColor
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 100
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("model.itemId:", model.itemId, "model.item1:", model.item1, "model.item2:", model.item2);

                    if (editDataDialog) {
                        console.log("Opening edit dialog for ID: ", model.itemId);
                        if (editDataDialog.firstFieldInput && editDataDialog.secondFieldInput) {
                            editDataDialog.firstFieldInput.text = model.item1 || "";
                            editDataDialog.secondFieldInput.text = model.item2 || "";
                            editDataDialog.visible = true;
                            console.log("editDataDialog:", editDataDialog);
                            console.log("editDataDialog.firstFieldInput:", editDataDialog.firstFieldInput);
                            console.log("editDataDialog.secondFieldInput:", editDataDialog.secondFieldInput);
                        } else {
                            console.log("Error: editDataDialog inputs are undefined.");
                        }
                    } else {
                        console.log("Item ID or editDataDialog is indefined.");
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
