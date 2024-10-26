pragma Singleton
import QtQuick

QtObject {
    // *** GENERAL SETTINGS ***
    property color transparentColor: "transparent"
    property color backgroundColor: "#ddedd7" // green type
    property color primaryColor: "#A52A2A"
    property color accentColor: "#FFF8DC"
    property color generalBorderColor: "green"
    property color footerColor: "#4da33f" // green type
    property string fontStyle: "Courier New"
    property int fontSize: 16

    // *** BUTTONS SETTINGS ***
    property color buttonColor: "transparent"
//    property color buttonInnerColor: "transparent"
//    property color buttonBorderColor: "black"
//    property color buttonTextColor: "white"

//    property real buttonTextFontSize: 20
//    property real buttonWidth: 40
//    property real buttonHeight: 40
//    property real buttonRadius: 20
//    property real buttonBorderWidth: 2

    property string buttonTextAdd: "Add"
    property string buttonTextSave: "Save"
    property string buttonTextOK: "OK"
//    property string buttonTextEdit: "Edit"
//    property string buttonTextDelete: "Delete"

    // *** LISTS SETTINGS ***
    property color listInnerColor: "transparent"
    property color listBorderColor: "#8FBC8F" // green type
    property real listWidth: 300
    property real listHeight: 50
    property real listRadius: 8
    property real listBorderWidth: 0.8

    // *** ICONS SETTINGS ***
    property real iconWidth: 50
    property real iconHeight: 50
}
