pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"
import "../styles"

// Page {
//     id: detailScreen
//     anchors.fill: parent
//     background: parent

    Flickable {
        id: flickableArea
        anchors.fill: parent
        contentHeight: columnLayout.height
        flickableDirection: Flickable.VerticalFlick
        clip: true // zapobiega wyświetlaniu elementów poza obszarem przwijania - NIE NIE ZAPOBIEGA!


        Component.onCompleted: {
            flickableArea.contentY = 0 // ustawienie góry ekranu po załadowaniu
        }

        Column {
            spacing: 10
            width: parent.width * 0.9
            anchors.fill: parent

            InfoCard {
                title: "About Blood Pressure"
                description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
            }

            InfoCard {
                title: "About Pulse Sensor"
                description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
            }

            InfoCard {
                title: "About Bluetooth Low Energy"
                description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
            }
        }
    }
//}

