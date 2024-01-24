
import QtQuick 2.0
import QtQuick.Controls 2.0
//import "main.qml"
Rectangle {
    y:120
    width: 360
    height: 640-120
    ListModel {
            id: model
            ListElement {
                name:'abc'
                number:'123'

            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'xyz'
                number:'789'
            }
            ListElement {
                name:'abc'
                number:'123'
            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'abc'
                number:'123'

            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'xyz'
                number:'789'
            }
            ListElement {
                name:'abc'
                number:'123'
            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'abc'
                number:'123'

            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'xyz'
                number:'789'
            }
            ListElement {
                name:'abc'
                number:'123'
            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'abc'
                number:'123'

            }
            ListElement {
                name:'efg'
                number:'456'
            }
            ListElement {
                name:'xyz'
                number:'789'
            }
            ListElement {
                name:'abc'
                number:'123'
            }
            ListElement {
                name:'efg'
                number:'456'
            }


        }
    ScrollView {
        clip: true
        width: 360
        height: parent.height
        ListView {
            id: list
            width: 360
            model: model
           delegate: Component {
               Item {
                   width: 360
                   height: 68
                   Rectangle
                   {


           Image {
                       id: image3
                       x: 8
                       y: 15
                       width: 54
                       height: 38
                       source: "../images/user.png"
                       fillMode: Image.PreserveAspectFit
                   }

                   Text {
                       id: text3
                       x: 68
                       y: 3
                       text: name
                       font.pixelSize: 20
                   }

                   Text {
                       id: text6
                       x: 68
                       y: 38
                       width: 197
                       height: 30
                       text: number
                       font.pixelSize: 20
                   }

                   Text {
                       id: text7
                       x: 299
                       y: 23
                       text: qsTr("9:48")
                       font.pixelSize: 20
                   }

                   Rectangle {
                       id: rectangle5s
                       x: 308
                       y: 43
                       width: 20
                       height: 20
                       visible: false
                       color: "#36eb4a"
                       radius: 100
                   }
   //                    Column {
   //                        Text { text: 'Name:' + name }
   //                        Text { text: 'Number:' + number }
   //                    }
       }




                   MouseArea {
                       anchors.fill: parent
                       onClicked: list.currentIndex = index
                   }
               }
           }
           highlight: Rectangle {
                       color: 'grey'
           //            Text {
           //                anchors.centerIn: parent
           //                text: 'Hello ' + model.get(list.currentIndex).name
           //                color: 'white'
           //            }
                   }
                   focus: true
                   function event (){
                       console.log(model.get(list.currentIndex).name + ' selected')
                       console.log(isclickeduser+ ' isclickeduser')
                       isclickeduser=true
                   }



                   onCurrentItemChanged: event()
           //        onCurrentItemChanged: myloader.source = "temp.qml"


               }
           }

        }


