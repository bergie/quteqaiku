import Qt 4.7

Rectangle {
    id: mainstream
    property string currentFeed: "http://www.qaiku.com/api/statuses/public_timeline.xml"

    states: [
        State {
            name: "public"
            PropertyChanges {
                target: mainstream
                currentFeed: "http://www.qaiku.com/api/statuses/public_timeline.xml"
            }
        },
        State {
            name: "user"
            PropertyChanges {
                target: mainstream
                currentFeed: "http://www.qaiku.com/api/statuses/friends_timeline.xml?apikey=" + MainSettings.readSetting("apikey")
            }
        }
    ]

    onStateChanged: {
        console.log("Reloading " + mainstream.currentFeed + " for " + mainstream.state);
        qaikuModel.reload();
    }

    function startupFunction() {
       if (MainSettings.readSetting("apikey") != "")
       {
           console.log("Switching state");
           mainstream.state = "user";
       }
    }

    Component.onCompleted: startupFunction();

    XmlListModel {
         id: qaikuModel
         source: mainstream.currentFeed
         query: "/statuses/status"

         XmlRole {
            name: "status"
            query: "text/string()"
         }
         XmlRole {
             name: "author"
             query: "user/screen_name/string()"
         }
    }

    Row {
        ListView {
            id: list
            width: mainstream.width
            height: mainstream.height
            model: qaikuModel
            delegate: StatusDelegate{}
        }
    }
}
