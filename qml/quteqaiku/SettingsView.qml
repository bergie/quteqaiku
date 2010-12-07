import Qt 4.7

Rectangle {
    width: 200
    height: 400

    Text {
        id: apiKeyLabel
        width: 100
        text: "Enter your <a href='http://www.qaiku.com/settings/api/'>Qaiku API key</a>"
        anchors.bottom:  apiKeyInput.top
    }

    Text {
        id: apiKeyStatus
        width: 100
        text: ""
        anchors.top: apiKeyInput.bottom
    }

    TextInput
    {
        width: 100
        id: apiKeyInput
        x: 0
        y: 27
        text: MainSettings.readSetting("apikey")
    }

    Rectangle
    {
        x: 107
        y: 27
        anchors.left: apiKeyInput.right
        width: 40
        height: apiKeyInput.height
        color: "grey"
        anchors.leftMargin: 7
        Text {
            text: "Save"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                    if (doc.readyState == XMLHttpRequest.DONE) {
                        if (doc.status == 200) {
                            MainSettings.saveSetting("apikey", apiKeyInput.text);
                            apiKeyStatus.text = "API key saved";
                            apiKeyStatus.color = "green";
                            window.state = "stream";
                        }
                        else {
                            apiKeyStatus.text = "Incorrect API key";
                            apiKeyStatus.color = "red";
                            return;
                        }
                    }
                }
                doc.open("GET", "http://www.qaiku.com/api/statuses/user_timeline.json?apikey=" + apiKeyInput.text);
                doc.send();
            }
        }
    }
}
