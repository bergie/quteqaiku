import Qt 4.7

Rectangle {
    id: window
    width: 200
    height: 400
    property string currentMessage: ""

    states: [
        State {
            name: "stream"
            PropertyChanges {
                target: window
                x: 0
                y: 0
            }
        },
        State {
            name: "message"
            PropertyChanges {
                target: window
                x: -window.width
                y: 0
            }
        },
        State {
            name: "settings"
            PropertyChanges {
                target: window
                y: window.height
            }
        }
    ]
    transitions: [
            Transition {
                NumberAnimation {
                    properties: "x,y"
                    duration: 300
                    easing.type: "InOutQuad"
                }
            }
    ]

    StreamView {
        id: streamView
        width: window.width
        height: window.height
        state: "public"
    }
    MessageView {
        id: messageView
        anchors.left: streamView.right
        width: window.width
        height: window.height
    }
    SettingsView {
        id: settingsView
        anchors.bottom: streamView.top
        width: window.width
        height: window.height
    }

    Item
    {
        id: transitionWatcher
        focus: true
        Keys.onPressed: {
             switch (event.key) {
                case Qt.Key_Right:
                    window.state = "message";
                    break;
                case Qt.Key_Left:
                case Qt.Key_Down:
                    window.state = "stream";
                    break;
                case Qt.Key_Up:
                    window.state = "settings";
                    break;
             }
         }
    }
}
