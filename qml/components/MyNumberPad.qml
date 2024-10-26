import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: numPadItem  // Główny element Item

//    property var currentModel: null
//    property int currentIndex: -1
//    property string enteredNumbers: ""

//    signal open(var model, int index)

//    function showSheet() {
//        numPadSheet.visible = true
//        numPadSheet.y = parent.height - numPadSheet.height
//    }

//    function hideSheet() {
//        numPadSheet.y = parent.height
//        numPadSheet.visible = false
//    }

//    function open(model, index) {
//        currentModel = model
//        currentIndex = index
//        enteredNumbers = model.selectedOption; // Load existing value if any
//        showSheet()
//    }

//    Rectangle {
//        id: numPadSheet  // Przypisz identyfikator do elementu Rectangle, a nie do Item
//        visible: false
//        color: "white"
//        border.color: "green"
//        border.width: 0.5
//        width: parent.width
//        height: Math.max(parent.height * 0.5, 240) // Zapewnij odpowiednią wysokość dla numpada
//        radius: 10
//        y: parent.height

//        Behavior on y {
//            SpringAnimation {
//                spring: 5
//                damping: 0.3
//            }
//        }

//        ColumnLayout {
//            anchors.fill: parent
//            anchors.margins: 10

//            Text {
//                text: enteredNumbers === "" ? "Enter number" : enteredNumbers
//                font.bold: true
//                font.pointSize: 17
//                Layout.alignment: Qt.AlignCenter
//            }

//            GridLayout {
//                columns: 3
//                Layout.alignment: Qt.AlignCenter

//                // Buttons 1-9
//                Repeater {
//                    model: 9
//                    delegate: Button {
//                        width: 50
//                        height: 50
//                        text: (index + 1).toString()
//                        font.pixelSize: 24
//                        onClicked: {
//                            enteredNumbers += (index + 1).toString();
//                        }
//                    }
//                }

//                // Pusty slot pod przyciskiem 9
//                Rectangle {
//                    width: 50
//                    height: 50
//                    color: "transparent"
//                }

//                // Przycisk 0 pod 8
//                Button {
//                    width: 50
//                    height: 50
//                    text: "0"
//                    font.pixelSize: 24
//                    onClicked: {
//                        enteredNumbers += "0";
//                    }
//                }

//                // Pusty slot pod 9
//                Rectangle {
//                    width: 50
//                    height: 50
//                    color: "transparent"
//                }
//            }

//            Button {
//                Layout.alignment: Qt.AlignCenter
//                background: Rectangle {
//                    color: "green"
//                    radius: 8
//                    border.color: "black"
//                    border.width: 0.5
//                }
//                contentItem: Text {
//                    text: "Save"
//                    color: "black"
//                    font.pixelSize: 15
//                    horizontalAlignment: Text.AlignHCenter
//                    verticalAlignment: Text.AlignVCenter
//                }
//                onClicked: {
//                    if (currentIndex >= 0 && currentModel !== null) {
//                        currentModel.selectedOption = enteredNumbers; // Zapisz wartość
//                    }
//                    hideSheet();  // Używaj funkcji hideSheet zamiast numPadSheet.hideSheet
//                }
//            }
//        }

//        MouseArea {
//            anchors.fill: parent
//            onClicked: hideSheet()  // Zmień na wywołanie funkcji hideSheet
//        }
//    }
}
