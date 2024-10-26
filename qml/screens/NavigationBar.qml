<<<<<<< HEAD
import QtQuick
import QtQuick.Controls

Item {
    width: parent.width
    height: 40

    property var stackView

    TabBar {
        id: tabBar
        width: parent.width
        height: parent.height

//        TabButton {
//            text: "Home"
//            onClicked: {
//                stackView.replace("screens/HomeScreen.qml")
//            }
//        }
        Repeater {
            model: ["Home", "Daily Data", "Settings", "Login", "Logout"]

            TabButton {
                text: modelData
                width: Math.max(100, bar.width / 5)
            }
        }
    }
}
=======
import QtQuick
import QtQuick.Controls

Item {
    width: parent.width
    height: 40

    property var stackView

    TabBar {
        id: tabBar
        width: parent.width
        height: parent.height

//        TabButton {
//            text: "Home"
//            onClicked: {
//                stackView.replace("screens/HomeScreen.qml")
//            }
//        }
        Repeater {
            model: ["Home", "Daily Data", "Settings", "Login", "Logout"]

            TabButton {
                text: modelData
                width: Math.max(100, bar.width / 5)
            }
        }
    }
}
>>>>>>> 4bb0f1a3c23fce9587c1281eca66b854c8513c23
