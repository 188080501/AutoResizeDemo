import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: mainWindow
    title: qsTr("AutoResize")
    width: 800
    height: 600
    visible: true

    Rectangle {
        width: parent.width / 2
        height: parent.height / 2
        color: "#00000000"

        AutoResize {
            fixedAspectRatio: true
            accordingToX: true
        }

        Rectangle {
            x: 15
            y: 10
            width: 80
            height: 200
            color: "#ff0000"
        }

        Rectangle {
            x: 15
            y: 210
            width: 200
            height: 80
            color: "#00ff00"
        }

        Rectangle {
            x: 124
            y: 43
            width: 247
            height: 20
            color: "#0000ff"
        }

        Rectangle {
            x: 242
            y: 140
            width: 150
            height: 150
            color: "#000000"
        }
    }

    Rectangle {
        x: parent.width / 2
        width: parent.width / 2
        height: parent.height / 2
        color: "#00000000"

        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }

        Rectangle {
            x: 15
            y: 10
            width: 80
            height: 200
            color: "#ff0000"
        }

        Rectangle {
            x: 15
            y: 210
            width: 200
            height: 80
            color: "#00ff00"
        }

        Rectangle {
            x: 124
            y: 43
            width: 247
            height: 20
            color: "#0000ff"
        }

        Rectangle {
            x: 242
            y: 140
            width: 150
            height: 150
            color: "#000000"
        }
    }

    Rectangle {
        y: parent.height / 2
        width: parent.width / 2
        height: parent.height / 2
        color: "#00000000"

        AutoResize {
            fixedAspectRatio: true
            accordingToX: false
        }

        Rectangle {
            x: 15
            y: 10
            width: 80
            height: 200
            color: "#ff0000"
        }

        Rectangle {
            x: 15
            y: 210
            width: 200
            height: 80
            color: "#00ff00"
        }

        Rectangle {
            x: 124
            y: 43
            width: 247
            height: 20
            color: "#0000ff"
        }

        Rectangle {
            x: 242
            y: 140
            width: 150
            height: 150
            color: "#000000"
        }
    }
}
