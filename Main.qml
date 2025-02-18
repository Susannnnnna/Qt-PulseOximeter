pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "qml/styles" //singleton
import "./qml/screens"
import "./qml/components"

ApplicationWindow {
    visible: true
    width: 360
    height: 640

    // Screens paths
    property string bloodPressureScreenPath:    MyStyles.rootPath + "qml/screens/BloodPressureScreen.qml"
    property string dataScreenPath:             MyStyles.rootPath + "qml/screens/DataScreen.qml"
    property string knowledgeScreenPath:        MyStyles.rootPath + "qml/screens/KnowledgeScreen.qml"

    // Menus titles
    property string bloodPressureTitle:         "Blood Pressure"
    property string dataTitle:                  "Data"
    property string knowledgeTitle:             "Knowledge"

    // Icons paths
    property string sideMenuIcon:           MyStyles.rootPath + "assets/icons/dots.png"
    property string chartsIcon:             MyStyles.rootPath + "assets/icons/analysis.png"
    property string heartIcon:              MyStyles.rootPath + "assets/icons/heart.png"
    property string heartDigitalIcon:       MyStyles.rootPath + "assets/icons/love-always-wins.png"
    property string konwledgeIcon:          MyStyles.rootPath + "assets/icons/light-bulb.png"
    property string homeIcon:               MyStyles.rootPath + "assets/icons/home.png"

    Material.accent: "transparent"
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    header: ToolBar {
        id: header
        contentHeight: 60 //headerRow.height
        background: Rectangle {
            color: MyStyles.ribbonColor
        }

        Row {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            // Left side header
            ToolButton {
                id: sideMenuButton

                hoverEnabled: false
                highlighted: false

                ImageIcons { iconPath: sideMenuIcon }

                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    if (drawer.visible) {
                        drawer.close()
                    } else {
                        drawer.open()
                    }
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Middle side header
            Row {
                spacing: 5
                anchors.centerIn: parent

                Label {
                    id: headerLabel
                    text: "Home"
                    color: MyStyles.fontColor
                    font.pointSize: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Right side header
            ToolButton {
                id: homeButton
                visible: false

                hoverEnabled: false
                highlighted: false

                ImageIcons { iconPath: homeIcon }

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    headerLabel.text = "Home"
                    homeButton.visible = false
                    stackView.push(bloodPressureScreenPath)
                    footer.visible = true
                }
            }
        }

        // Line on the top of the header
        LineSeparator { lineHeight: 2; lineColor: MyStyles.linesColor }
    }

    // Side menu
    Drawer {
        id: drawer
        width: (parent.width * 2) / 3
        height: parent.height
        edge: Qt.LeftEdge

        ListView {
            width: parent.width
            height: parent.height
            model: [
                "bloodPressureTitle",
                dataTitle,
                knowledgeTitle
            ]
            delegate: ItemDelegate {
                width: parent.width
                height: 50

                text: modelData
                font.pointSize: 12

                highlighted: false
                hoverEnabled: false

                Rectangle {
                    width: parent.width * 0.9
                    height: 1
                    color: MyStyles.linesColor //"lightgray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                }

                background: Rectangle {
                    color: "transparent"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        drawer.close()
                        if (modelData === "bloodPressureTitle") {
                            homeButton.visible = true
                            headerLabel.text = ""
                            stackView.push(bloodPressureScreenPath)
                            footer.visible = false
                        } else if (modelData === dataTitle) {
                            homeButton.visible = true
                            headerLabel.text = ""
                            stackView.push(dataScreenPath)
                            footer.visible = false
                        } else if (modelData === knowledgeTitle) {
                            homeButton.visible = true
                            headerLabel.text = ""
                            stackView.push(Qt.resolvedUrl(knowledgeScreenPath))
                            footer.visible = false
                        } else {
                            stackView.push(Qt.resolvedUrl(bloodPressureScreenPath), { category: modelData })
                        }
                    }
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: bloodPressureScreenPath

        onCurrentItemChanged:
            tabBar.visible = !(stackView.currentItem instanceof HomeScreen)
    }

    footer: TabBar {
        id: footer
        height: 50

        background: Rectangle {
            color: MyStyles.ribbonColor
        }

        TabButtonFooter {
            id: heartTab
            stackViewPath: Qt.resolvedUrl(bloodPressureScreenPath)
            iconPath: heartIcon
            labelText: "Pulse Chart"
        }

        TabButtonFooter {
            id: chartsTab
            stackViewPath: Qt.resolvedUrl(dataScreenPath)
            iconPath: chartsIcon
            labelText: "Data"
        }

        TabButtonFooter {
            id: knowledgeTab
            stackViewPath: Qt.resolvedUrl(knowledgeScreenPath)
            iconPath: konwledgeIcon
            labelText: "Knowledge"
        }
    }
}
