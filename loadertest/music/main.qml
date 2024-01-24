import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia
import Qt.labs.folderlistmodel
Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hello World")

    Loader{
        source: "mymusic.qml"
    }






}
