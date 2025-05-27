import QtQuick

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Clock")
    color: "lightgrey"

    Item {
        property int _minSide: Math.min(root.width, root.height)
        x: 10 + (root.width - _minSide)/2
        y: 10 + (root.height - _minSide)/2
        width: _minSide - 20
        height: _minSide - 20
        scale: Math.min (width / background.sourceSize.width, height / background.sourceSize.height)
        transformOrigin: Item.TopLeft



        Image {
            id: background
            source: "background.png"
        }

        Image {
            id: largeArm
            source: "largeArm.png"
            x: background.width/2 - width/2
            y: background.height/2 - 1255

            transform: Rotation {
                origin.x: largeArm.width/2
                origin.y: 1255
                RotationAnimation on angle {
                    from: 0
                    to: 360 * 24
                    duration: 60000
                    loops: Animation.Infinite
                }
            }
        }

        Image {
            id: smallArm
            source: "smallArm.png"
            x: background.width/2 - width/2
            y: background.height/2 - 914

            transform: Rotation {
                origin.x: smallArm.width/2
                origin.y: 914

                RotationAnimation on angle {
                    from: 0
                    to: 360
                    duration: 60000
                    loops: Animation.Infinite
                }
            }
        }
    }

}
