<<<<<<< HEAD
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    anchors.fill: parent
    background: parent

    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            ListElement { name: "Nick"; selectedOption: "nikitaS" }
            ListElement { name: "Birth year"; selectedOption: "1994" }
            ListElement { name: "Weight [kg]"; selectedOption: "52" }
            ListElement { name: "Height [cm]"; selectedOption: "162" }
            ListElement { name: "Gender"; selectedOption: "Female" }
        }
    }

//        delegate: Item {
//            width: listView.width
//            height: 50

//            RowLayout {
//                anchors.fill: parent

//                Text {
//                    text: model.name
//                    font.pointSize: 16
//                    Layout.alignment: Qt.AlignVCenter
//                }

//                Text {
//                    text: model.selectedOption
//                    font.pointSize: 16
//                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
//                    width: 100
//                }
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    if (model.name === "Gender") {
//                        genderSheet.open(model, index)
//                    } else {
//                        numPadSheet.open(model, index)  // Zmiana: wywołanie open na numPadSheet
//                    }
//                }
//            }
//        }
//    }

//    // Modal bottom sheet for gender selection
//    Rectangle {
//        id: genderSheet
//        visible: false
//        color: "white"

//        border.color: "green"
//        border.width: 0.5

//        width: parent.width
//        height: Math.max(parent.height * 0.33, 180) // Ensure minimum height for usability
//        radius: 10
//        y: parent.height

//        property var currentModel: null
//        property int currentIndex: -1
//        property string selectedGender: ""

//        signal open(var model, int index)

//        function showSheet() {
//            genderSheet.visible = true
//            genderSheet.y = parent.height - genderSheet.height
//        }

//        function hideSheet() {
//            genderSheet.y = parent.height
//            genderSheet.visible = false
//        }

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
//                text: "Choose gender"
//                font.bold: true
//                font.pointSize: 17
//                Layout.alignment: Qt.AlignLeft
//            }

//            RadioButton {
//                text: "Female"
//                font.pixelSize: 15
//                checked: selectedGender === "Female"
//                onClicked: {
//                    selectedGender = "Female"
//                }
//            }

//            RadioButton {
//                text: "Male"
//                font.pixelSize: 15
//                checked: selectedGender === "Male"
//                onClicked: {
//                    selectedGender = "Male"
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
//                        listView.model.setProperty(currentIndex, "selectedOption", selectedGender);
//                    }
//                    genderSheet.hideSheet();
//                }
//            }
//        }

//        MouseArea {
//            anchors.fill: parent
//            onClicked: genderSheet.hideSheet()
//        }

//        onOpen: {
//            currentModel = model
//            currentIndex = index
//            selectedGender = model.selectedOption; // Update the selected gender based on current model data
//            showSheet()
//        }
//    }

//    // Number Pad
//    MyNumberPad {
//        id: numPadSheet  // Identyfikator numPadSheet
//    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            genderSheet.hideSheet()
//            numPadSheet.hideSheet()  // Wywołanie hideSheet na numPadSheet
//        }
//        visible: genderSheet.visible || numPadSheet.visible
//    }
}
=======
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    anchors.fill: parent
    background: parent

    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            ListElement { name: "Nick"; selectedOption: "nikitaS" }
            ListElement { name: "Birth year"; selectedOption: "1994" }
            ListElement { name: "Weight [kg]"; selectedOption: "52" }
            ListElement { name: "Height [cm]"; selectedOption: "162" }
            ListElement { name: "Gender"; selectedOption: "Female" }
        }
    }

//        delegate: Item {
//            width: listView.width
//            height: 50

//            RowLayout {
//                anchors.fill: parent

//                Text {
//                    text: model.name
//                    font.pointSize: 16
//                    Layout.alignment: Qt.AlignVCenter
//                }

//                Text {
//                    text: model.selectedOption
//                    font.pointSize: 16
//                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
//                    width: 100
//                }
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    if (model.name === "Gender") {
//                        genderSheet.open(model, index)
//                    } else {
//                        numPadSheet.open(model, index)  // Zmiana: wywołanie open na numPadSheet
//                    }
//                }
//            }
//        }
//    }

//    // Modal bottom sheet for gender selection
//    Rectangle {
//        id: genderSheet
//        visible: false
//        color: "white"

//        border.color: "green"
//        border.width: 0.5

//        width: parent.width
//        height: Math.max(parent.height * 0.33, 180) // Ensure minimum height for usability
//        radius: 10
//        y: parent.height

//        property var currentModel: null
//        property int currentIndex: -1
//        property string selectedGender: ""

//        signal open(var model, int index)

//        function showSheet() {
//            genderSheet.visible = true
//            genderSheet.y = parent.height - genderSheet.height
//        }

//        function hideSheet() {
//            genderSheet.y = parent.height
//            genderSheet.visible = false
//        }

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
//                text: "Choose gender"
//                font.bold: true
//                font.pointSize: 17
//                Layout.alignment: Qt.AlignLeft
//            }

//            RadioButton {
//                text: "Female"
//                font.pixelSize: 15
//                checked: selectedGender === "Female"
//                onClicked: {
//                    selectedGender = "Female"
//                }
//            }

//            RadioButton {
//                text: "Male"
//                font.pixelSize: 15
//                checked: selectedGender === "Male"
//                onClicked: {
//                    selectedGender = "Male"
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
//                        listView.model.setProperty(currentIndex, "selectedOption", selectedGender);
//                    }
//                    genderSheet.hideSheet();
//                }
//            }
//        }

//        MouseArea {
//            anchors.fill: parent
//            onClicked: genderSheet.hideSheet()
//        }

//        onOpen: {
//            currentModel = model
//            currentIndex = index
//            selectedGender = model.selectedOption; // Update the selected gender based on current model data
//            showSheet()
//        }
//    }

//    // Number Pad
//    MyNumberPad {
//        id: numPadSheet  // Identyfikator numPadSheet
//    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            genderSheet.hideSheet()
//            numPadSheet.hideSheet()  // Wywołanie hideSheet na numPadSheet
//        }
//        visible: genderSheet.visible || numPadSheet.visible
//    }
}
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
