import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import MyStyles 1.0 //singleton
import "screens"

ApplicationWindow {
    visible: true
    width: 360
    height: 640

    // Screens paths
    property string homeScreenPath:                 "screens/HomeScreen.qml"
    property string testScreenPath:                 "screens/TESTScreen.qml"
    property string additionaDataScreenPath:        "screens/AdditionalDataMenu.qml"
    property string chartsScreenPath:               "screens/ChartsScreen.qml"
    property string everydayWellBeingScreenPath:    "screens/EverydayWellBeingScreen.qml"
    property string knowledgeScreenPath:            "screens/KnowledgeScreen.qml"
    property string loginScreenPath:                "screens/LoginScreen.qml"
    property string logoutScreenPath:               "screens/LogoutScreen.qml"
    property string mealsScreenPath:                "screens/MealsScreen.qml"
    property string pulseOximeterScreenPath:        "screens/PulseOximeterScreen.qml"
    property string settingsScreenPath:             "screens/SettingsScreen.qml"

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

                Image {
                    source: sideMenuIcon
                    width: MyStyles.iconWidth
                    height: MyStyles.iconHeight
                    anchors.verticalCenter: parent.verticalCenter
                }
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
                color: MyStyles.transparentColor
            }

            // Middle side header
            Row {
                spacing: 5
                anchors.centerIn: parent

                Image {
                    id: dynamicHeaderIcon
                    visible: false
                    source: ""
                    width: MyStyles.iconWidth
                    height: MyStyles.iconHeight
                    anchors.verticalCenter: parent.verticalCenter
                }

                Label {
                    id: headerLabel
                    text: mainTitle
                    color: "black"
                    font.pointSize: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: MyStyles.transparentColor
            }

            // Right side header
            ToolButton {
                id: homeButton
                visible: false

                hoverEnabled: false
                highlighted: false

                Image {
                    source: homeIcon
                    width: (MyStyles.iconWidth * 2) / 3
                    height: (MyStyles.iconHeight * 2) / 3
                    anchors.centerIn: parent
                }
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    dynamicHeaderIcon.visible = false
                    headerLabel.text = mainTitle
                    homeButton.visible = false
                    stackView.push(homeScreenPath)
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
                exerciseTitle,
                mealsTitle,
                everydayWellBeingTitle,
                additionalEventsTitle,
                settingsTitle,
                logoutTitle]
            delegate: ItemDelegate {
                text: modelData
                onClicked: {
                    drawer.close()
                    if (modelData === exerciseTitle) {
                        dynamicHeaderIcon.visible = true
                        dynamicHeaderIcon.source = exerciseIcon
                        homeButton.visible = true
                        headerLabel.text = ""
                        stackView.push(testScreenPath) //CHANGE
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
                        stackView.push(testScreenPath) //CHANGE
                        footer.visible = false
                    } else if (modelData === settingsTitle) {
                        dynamicHeaderIcon.visible = true
                        dynamicHeaderIcon.source = settingsIcon
                        homeButton.visible = true
                        headerLabel.text = ""
                        homeButton.visible = true
                        stackView.push(testScreenPath) //CHANGE
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
                        stackView.push(homeScreenPath, { category: modelData })
                    }
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl(homeScreenPath)

        onCurrentItemChanged:
            tabBar.visible = !(stackView.currentItem instanceof HomeScreen)
    }

    footer: TabBar {
        id: footer
        height: 50

        background: Rectangle {
            color: MyStyles.footerColor
        }

        TabButton {
            id: chartsTab

            contentItem: Column {
                spacing: 0
                Image {
                    source: chartsIcon
                    width: MyStyles.iconWidth - 5
                    height: MyStyles.iconHeight - 5
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: parent.width
                height: 3
                color: "green"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
            }
            onClicked: stackView.push(testScreenPath) //CHANGE
        }

        TabButton {
            id: pulseOximeterTab

            contentItem: Column {
                spacing: 0
                Image {
                    source: pulseOximeterIcon
                    width: MyStyles.iconWidth - 5
                    height: MyStyles.iconHeight - 5
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: parent.width
                height: 3
                color: "green"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
            }
            onClicked: stackView.push(testScreenPath) //CHANGE
        }

        TabButton {
            id: knowledgeTab

            contentItem: Column {
                spacing: 0
                Image {
                    source: konwledgeIcon
                    width: MyStyles.iconWidth - 5
                    height: MyStyles.iconHeight - 5
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: parent.width
                height: 3
                color: "green"
                anchors.bottom: parent.top
            }
            onClicked: stackView.push(testScreenPath) //CHANGE
        }

        Rectangle {
            width: parent.width
            height: 3  // Grubość linii
            color: "orange"
            anchors.top: parent.top
            z: 1  // Zwiększenie z-index, aby linia była na wierzchu
        }
    }
}
