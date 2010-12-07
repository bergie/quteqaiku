import Qt 4.7

Item {
    id: delegate
    height: column.height + 40
    width: delegate.ListView.view.width

    MouseArea {
        anchors.fill: parent
        onClicked: {
            window.state = "message";
            window.currentMessage = statusText.text;
        }
    }

    Column {
        id: column
        x: 20; y: 20
        width: parent.width - 40

        Text {
            id: authorText
            text: author
            width: parent.width
            wrapMode: Text.WordWrap
            font { bold: true; family: "Helvetica"; pointSize: 16 }
        }

        Text {
            id: statusText
            width: parent.width
            text: status
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
        }
    }

    Rectangle {
        width: parent.width; height: 1; color: "#cccccc"
        anchors.bottom: parent.bottom
    }
}
