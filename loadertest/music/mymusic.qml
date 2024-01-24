import QtQuick 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia
import QtQuick 6.2
import QtQuick.Controls 6.2
import Qt.labs.folderlistmodel

Rectangle{
    width: 360
    height: 640
//    Rectangle {
//        width: 150
//        height: 50
//        color:"grey"

//        MediaPlayer {
//            id: playMusic
//            source: "../music/sample.wav"
//            audioOutput: AudioOutput {}
//        }
//        MouseArea {
//            anchors.fill: parent
//            onPressed:  { console.log("clicked...")
//                playMusic.play()
//                console.log("started...")

//            }
//        }
//    }
    Rectangle {
        id:mainrect
        width:360
        height: 640
        color: "#241f31"
        property bool isplaying: false

        MediaPlayer {
            id: playMusic
//            source: "../musicfiles/day.mp3"
            source:"file:///home/bk/Desktop/Qt/qt quick/music/musicfiles/01.Daydreamer.mp3"
            audioOutput: AudioOutput {
                id:playMusicaudio
                volume: volumeSlider.value

            }

        }
        property MediaPlayer mediaPlayer: playMusic

        Item {
            id: playLogic

            property int index: -1
//            property FolderListModel items:


            function init(){

                if(playMusic.playbackState===MediaPlayer.PlayingState){
                    pauseM()
                    console.log("on paused")
                }else if(playMusic.playbackState===MediaPlayer.PausedState){
                    playM()
                    console.log("on played")

                }else{
                    console.log("entered into else setting index 0")
                    setIndex(0);
                }
                titile.text= getTitle()

            }

            function setIndex(i)
            {
                index = i;

                if (index < 0 || index >= folderModel.count)
                {
                    index = 0;
                    playMusic.source = "file://"+folderModel.get(index,"filePath");
                }
                else{
                    playMusic.source = "file://"+folderModel.get(index,"filePath");
                    console.log("from logic : "+playMusic.source)
                    playM()
                }
            }
            function playM(){
                mainrect.isplaying=true
                playpause.source="../icons/pause.png"
                playMusic.play();
            }
            function pauseM(){
                mainrect.isplaying=false
                playpause.source="../icons/play.png"
                playMusic.pause();
            }

            function next(){
                setIndex(index + 1);
                titile.text= getTitle()

            }

            function previous(){
                setIndex(index - 1);
                titile.text= getTitle()

            }

            function msToTime(duration) {
                var seconds = parseInt((duration/1000)%60);
                var minutes = parseInt((duration/(1000*60))%60);

                minutes = (minutes < 10) ? "0" + minutes : minutes;
                seconds = (seconds < 10) ? "0" + seconds : seconds;

                return minutes + ":" + seconds;
            }
            function getTitle(){


                return folderModel.get(index,"fileName");
            }
            FolderListModel {
                id: folderModel
                folder: "file:///home/bk/Desktop/Qt/qt%20quick/music/musicfiles"
                nameFilters: ["*.mp3"]
                onStatusChanged: if (folderModel.status === FolderListModel.Ready)
                                 {
                                     console.log('Loaded')
                                     console.log(playMusic.source)
                                     playLogic.init()
                                     console.log(folderModel.get(0,"filePath"))

                                 }
            }


//            Connections {
//                target: playLogic.mediaPlayer
//                onpause
//                onpause: {
//                    console.log("connnections pause...")
//                }

//                onPlayin {
//                     console.log("connnections playing ...")
//                }

//                onStopped: {
//                    console.log("connnections stopped...")
////                    if (playLogic.mediaPlayer.status === MediaPlayer.EndOfMedia)
////                        playLogic.next();
//                }

//                onError: {
//                    console.log(error+" error string is "+errorString);
//                }

//                onMediaObjectChanged: {
//                    console.log("onMediaObjectChanged ...")
//                    if (playLogic.mediaPlayer.mediaObject)
//                        playLogic.mediaPlayer.mediaObject.notifyInterval = 50;
//                }
//            }

        }

        Image {
            id: playpause
            x: 161
            y: 434
            width: 45
            height: 52
            source: "../icons/play.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                onReleased: {
                    console.log(mainrect.isplaying)
                    if(!mainrect.isplaying)
                    {
                        console.log("clicked..."+playMusic.bufferProgress)
                        playLogic.playM()
                        console.log("started...")
                    }
                    else
                    {
                        console.log("clicked..."+playMusic.bufferProgress)
                        playLogic.pauseM()
                        console.log("pause...")
                    }
                }
            }
        }

        Image {
            id: rewindButton
            x: 58
            y: 434
            width: 45
            height: 52
            source: "../icons/rewind.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                anchors.fill: parent
                onClicked: playLogic.previous()

            }
        }

        Image {
            id: forwardButton
            x: 257
            y: 434
            width: 45
            height: 52
            source: "../icons/forward.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                anchors.fill: parent
                onClicked: playLogic.next()

            }
        }

        Text {
            id: titile
            x: 160
            y: 361
            color: "#ffffff"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Slider {
            id: volumeSlider
            x: 24
            y: 146
            orientation: Qt.Vertical
//         property real volume: QtMultimedia.convertVolume(volumeSlider.value,
//                                                                    QtMultimedia.LogarithmicVolumeScale,
//                                                                    QtMultimedia.LinearVolumeScale)
            from: 0.
            to: 1.
            value: 0.5
        }
        Rectangle {
            id: buffer
            x: 8
            y: 555
            width: 344
            height: 8
            visible: false
            color: "#bd0036f5"

        }
        Slider {
            id: progresSlider
            x: 8
            y: 541
            width: 344
            height: 36
            value: (playMusic.position/playMusic.duration)
            onMoved:{
                playMusic.position=value*playMusic.duration
                playLogic.playM()
            }
        }

        Text {
            id: text1
            x: 8
            y: 519
            color: "#ffffff"
            text:playLogic.msToTime(playMusic.position)
            font.pixelSize: 14

        }

        Text {
            id: lasttimeTextview
            x: 317
            y: 519
            color: "#ffffff"
            text:playLogic.msToTime(playMusic.duration)
            font.pixelSize: 14
        }
        ListView {
            id: listView
            x: 66
            y: 41
            width: 273
            height: 284
            visible: false
            Component {
                id: fileDelegate
                Rectangle{
                    height:40
                    width: 273
                    clip: true
                    color: "#667d78fd"
                    Text { text: fileName
                        color:"white"
                    }
                }
            }

            model: folderModel
            delegate: fileDelegate
        }
//        Image {
//            id: playpause1
//            x: 294 Connections {
//                   target: playLogic.mediaPlayer
//                   function onPause(mouse) {  console.log("connnections pause...")}
//                   function onPlay(mouse) { console.log("connnections playing ...")}
//               }
//            y: 361
//            width: 45
//            height: 52
//            source: "icons/pause.png"
//            fillMode: Image.PreserveAspectFit
//            MouseArea {
//                anchors.fill: parent
//                onReleased: {
////                    playMusic.playbackState===MediaPlayer.PlayingState ? playLogic.playM() : playLogic.pauseM()
//                    console.log(playMusic.playbackState)
//                }
//            }
//        }
    }

}


