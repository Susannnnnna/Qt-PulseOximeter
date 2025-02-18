pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts
import "../components"
import "../styles"

Page {
    id: detailScreen
    anchors.fill: parent
    background: parent

    property string heartDigitalIcon: MyStyles.rootPath + "assets/icons/heart.png"

    Column {
        width: parent.width
        height: parent.hight
        spacing: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10 // add space from the top

        // Button with BLE data to load
        Button {
            width: parent.width * 0.3
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: false
            highlighted: false

            background: Rectangle {
                color: MyStyles.cardsBackgroundColor
                radius: 10
            }

            contentItem: Text {
                text: "Run BLE"
                color: MyStyles.backgroundColor
                font.pixelSize: 20
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                console.log("BLE started")
            }
        }

        // Heart icon with pulse info
        Item {
            width: parent.width
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter

            ImageIcons {
                iconPath: heartDigitalIcon
                widthMultiplier: 6
                heightMultiplier: 6
                anchors.centerIn: parent
            }

            Text {
                text: "50 [bpm]"
                font.pixelSize: 25
                font.bold: true
                color: MyStyles.fontSize
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }
        }

        // // Chart
        // Item {
        //     width: parent.width
        //     height: parent.height * 0.5
        //     anchors.horizontalCenter: parent.horizontalCenter

        //     ChartView {
        //         id: chart
        //         width: parent.width * 0.9
        //         height: parent.height
        //         antialiasing: true
        //         anchors.centerIn: parent

        //         backgroundColor: MyStyles.cardsBackgroundColor
        //         plotAreaColor: MyStyles.cardsBackgroundColor // kolor obszaru gdzie rysowany jest wykres
        //         legend.visible: true
        //         legend.labelColor: MyStyles.backgroundColor // kolor tekstu legendy

        //         ValuesAxis {
        //             id: axisX
        //             min: 0
        //             max: 10
        //             //titleText: "Time [s]"
        //             gridVisible: false
        //             labelsColor: MyStyles.backgroundColor
        //         }

        //         ValuesAxis {
        //             id: axisY
        //             min: 50
        //             max: 150
        //             //titleText: "Heart Rate [BPM]"
        //             gridVisible: false
        //             labelsColor: MyStyles.backgroundColor
        //         }

        //         LineSeries {
        //             name: "Heart Rate"
        //             color: MyStyles.backgroundColor
        //             width: 2
        //             axisX: axisX //ValuesAxis { min: 0; max: 10 }
        //             axisY: axisY //ValuesAxis { min: 50; max: 150 }

        //             XYPoint { x: 0; y: 70 }
        //             XYPoint { x: 2; y: 90 }
        //             XYPoint { x: 4; y: 110 }
        //             XYPoint { x: 6; y: 95 }
        //             XYPoint { x: 8; y: 100 }
        //             XYPoint { x: 10; y: 80 }
        //         }
        //     }
        // }
    }
}
