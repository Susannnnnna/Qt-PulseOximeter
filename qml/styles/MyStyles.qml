pragma Singleton
import QtQuick

QtObject {
    // *** GENERAL SETTINGS ***
    property color backgroundColor: "#090590" // darkx3 blue
    property color linesColor:      "black"
    property color ribbonColor:     "#0E45FC" //dark blue
    property string fontStyle:      "Courier New"
    property int fontSize:          16
    property color fontColor:       "#99FFFF" // light blue
    property string rootPath:       Qt.resolvedUrl("../../") //"file:///C:/QtProjects/BLEPulseSensor/BLEPulseSensor/"

    // *** CARDS PROPERIES ***
    property color cardsBackgroundColor: "#57A4F0" // light blue

    // // *** DIALOGS SETTINGS ***
    // property color dialogBackgroundColor: "white"
    // property color dialogWarningBorderColor: "#FFD700" // yellow type
    // property color dialogConfirmBorderColor: "green"
    // property color dialogUnderlineLine: "lightgray"

    // // *** BUTTONS SETTINGS ***
    // property color buttonInnerColor: "#FFD700" // yellow type
    // property color buttonBorderColor: "black"

    // property string buttonTextAdd: "Add"
    // property string buttonTextSave: "Save"
    // property string buttonTextOK: "OK"

    // // *** LISTS SETTINGS ***
    // property color listInnerColor: "transparent"
    // property color listBorderColor: "#8FBC8F" // green type
    // property real listWidth: 300
    // property real listHeight: 50
    // property real listRadius: 8
    // property real listBorderWidth: 0.8

    // *** ICONS SETTINGS ***
    property real iconWidth: 30
    property real iconHeight: 30

}
