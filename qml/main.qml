//MealsScreen.qml is the first screen I created
//so you will find a lot of logs there

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import MyStyles 1.0 //singleton
import "screens"
import "components"

ApplicationWindow {
    visible: true
    width: 360
    height: 640

    // Screens paths
    //property string homeScreenPath:                 "screens/HomeScreen.qml"
    property string testScreenPath:                 "qrc:/qml/screens/TESTScreen.qml"
    property string additionaEventsScreenPath:        "qrc:/qml/screens/AdditionalEventsScreen.qml"
    property string chartsScreenPath:               "qrc:/qml/screens/ChartsScreen.qml"
    property string everydayWellBeingScreenPath:    "qrc:/qml/screens/EverydayWellBeingScreen.qml"
    property string knowledgeScreenPath:            "qrc:/qml/screens/KnowledgeScreen.qml"
    property string loginScreenPath:                "qrc:/qml/screens/LoginScreen.qml"
    property string logoutScreenPath:               "qrc:/qml/screens/LogoutScreen.qml"
    property string mealsScreenPath:                "qrc:/qml/screens/MealsScreen.qml"
    property string pulseOximeterScreenPath:        "qrc:/qml/screens/PulseOximeterScreen.qml"
    property string exercisesScreenPath:            "qrc:/qml/screens/ExercisesScreen.qml"
    property string settingsScreenPath:             "qrc:/qml/screens/SettingsScreen.qml"

    // Menus titles
    property string mainTitle:                  "Healthy Diary"
    property string exerciseTitle:              "Exercise"
    property string mealsTitle:                 "Meals"
    property string everydayWellBeingTitle:     "Everyday Well-Being"
    property string additionalEventsTitle:      "Additional Events"
    property string settingsTitle:              "Settings"
    property string logoutTitle:                "Log Out"

    // Icons paths
    property string sideMenuIcon:           "qrc:/assets/icons/menu-bar2.png"
    property string chartsIcon:             "qrc:/assets/icons/analytics.png"
    property string pulseOximeterIcon:      "qrc:/assets/icons/smartwatch2.png"
    property string konwledgeIcon:          "qrc:/assets/icons/information.png"
    property string foodIcon:               "qrc:/assets/icons/diet.png"
    property string homeIcon:               "qrc:/assets/icons/home-page.png"
    property string exerciseIcon:           "qrc:/assets/icons/yoga-pose.png"
    property string wellbeingIcon:          "qrc:/assets/icons/wellbeing.png"
    property string additionalEventsIcon:   "qrc:/assets/icons/additional-events.png"
    property string settingsIcon:           "qrc:/assets/icons/personal-settings.png"
    property string logoutIcon:             "qrc:/assets/icons/logout.png"

    Material.accent: transparent
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    header: ToolBar {
        id: header
        contentHeight: 60 //headerRow.height
        background: Rectangle {
            color: "white"
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

                ImageIcons { id: dynamicHeaderIcon }

                Label {
                    id: headerLabel
                    text: mainTitle
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
                    dynamicHeaderIcon.visible = false
                    headerLabel.text = mainTitle
                    homeButton.visible = false
                    stackView.push(chartsScreenPath)
                    footer.visible = true
                }
            }
        }

        // Green line on the top of the header
        Rectangle {
            width: parent.width
            height: 3  // Line thickness
            color: MyStyles.generalBorderColor
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Drawer {
        id: drawer
        width: (parent.width * 2) / 3
        height: parent.height
        edge: Qt.LeftEdge

        ListView {
            width: parent.width
            height: parent.height
            model: [
                settingsTitle,
                exerciseTitle,
                mealsTitle,
                everydayWellBeingTitle,
                additionalEventsTitle,
                logoutTitle
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
                    color: "lightgray"
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
                        if (modelData === settingsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = settingsIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            homeButton.visible = true
                            stackView.push(settingsScreenPath)
                            footer.visible = false
                        } else if (modelData === exerciseTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = exerciseIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            stackView.push(exercisesScreenPath)
                            footer.visible = false
                        } else if (modelData === mealsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = foodIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            stackView.push(mealsScreenPath)
                            footer.visible = false
                        } else if (modelData === everydayWellBeingTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = wellbeingIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            homeButton.visible = true
                            stackView.push(testScreenPath) //CHANGE
                            footer.visible = false
                        } else if (modelData === additionalEventsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = additionalEventsIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            homeButton.visible = true
                            stackView.push(additionaEventsScreenPath)
                            footer.visible = false
                        } else if (modelData === logoutTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = logoutIcon
                            homeButton.visible = true
                            headerLabel.text = ""
                            homeButton.visible = true
                            stackView.push(testScreenPath) //CHANGE
                            footer.visible = false
                        } else {
                            stackView.push(chartsScreenPath, { category: modelData })
                        }
                    }
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl(chartsScreenPath)

        onCurrentItemChanged:
            tabBar.visible = !(stackView.currentItem instanceof HomeScreen)
    }

    footer: TabBar {
        id: footer
        height: 50

        background: Rectangle {
            color: MyStyles.footerColor
        }

        TabButtonFooter {
            id: chartsTab
            stackViewPath: testScreenPath //CHANGE
            iconPath: chartsIcon
        }

        TabButtonFooter {
            id: pulseOximeterTab
            stackViewPath: pulseOximeterScreenPath
            iconPath: pulseOximeterIcon
        }

        TabButtonFooter {
            id: knowledgeTab
            stackViewPath: knowledgeScreenPath
            iconPath: konwledgeIcon
        }
    }
}
