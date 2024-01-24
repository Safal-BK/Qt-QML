import QtQuick 2.0

Rectangle {
    id:topbar
    y:0
    width: 360
    height: 120
    color: "green"
    Rectangle {
        id: rectangle3
        x: 0
        y: 0
        width: 360
        height: 130
        opacity: 1
        visible: true
        clip: true

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 360
            height: 62
            color: "#075e54"

            Text {
                id: text1
                x: 8
                y: 18
                width: 128
                height: 30
                color: "#ffffff"
                text: qsTr("WhatsApp")
                font.pixelSize: 24
                font.bold: true
            }

            Image {
                id: image
                x: 269
                y: 18
                width: 27
                height: 34
                source: "../images/lens.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="clicked on lens "
                            console.log( 'lens  selected')
                        }
                    }
            }

            Image {
                id: image1
                x: 324
                y: 17
                width: 28
                height: 28
                source: "../images/3dots.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="no options under maintainence"
                            console.log( 'lens  selected')
                        }
                    }
            }
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 52
            width: 360
            height: 79
            color: "#075e54"
            Text {
                id: text2
                x: 169
                y: 41
                color: "#ffffff"
                text: qsTr("STATUS")
                font.pixelSize: 20
                font.bold: true
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="clicked on STATUS"
                            console.log( 'lens  selected')
                            pageline.x=169
                            bottompage.source="staus.qml"

                        }
                    }
            }

            Image {
                id: image2
                x: 0
                y: 34
                width: 50
                height: 32
                source: "../images/camera.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="Soory not ready yet"
                            console.log( 'lens  selected')
                        }
                    }
            }

            Text {
                id: text4
                x: 266
                y: 39
                color: "#ffffff"
                text: qsTr("CALLS")
                font.pixelSize: 20
                font.bold: true
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="clicked on CALLS"
                            console.log( 'lens  selected')
                            pageline.x= 266
                            bottompage.source="calls.qml"

                        }
                    }
            }

            Text {
                id: text5
                x: 69
                y: 41
                height: 23
                color: "#ffffff"
                text: qsTr("CHATS")
                font.pixelSize: 20
                font.bold: true
                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            toast.text="clicked on CHATS"
                            console.log( 'lens  selected')
                            pageline.x=71
                            bottompage.source="bottom.qml"

                        }
                    }
            }
        }

        Rectangle {
            id: pageline
            x: 71
            y: 115
            width: 68
            height: 8
            color: "#ffffff"
        }
    }

}
