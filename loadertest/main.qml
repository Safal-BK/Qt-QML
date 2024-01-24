import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hello World")
    Loader{
        source: "upper.qml"
    }
    Loader{
        id:bottompage
        source: "bottom.qml"
    }
    property bool isclickeduser: false
    function user (){
        myloader.source = "temp.qml"
    }
    Text {
        anchors{
      horizontalCenter: parent.horizontalCenter
//      verticalCenter: parent.verticalCenter
         }
        id: toast
        x: 161
        y: 600
        text: qsTr("")
        font.pixelSize: 25
    }
}
