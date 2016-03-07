import QtQuick 2.0
import Ubuntu.Components 1.1

FocusScope {
    id: root
    width:parent.width;

    property string term;
    property ListModel model;
    property int zorder: view.z

    onFocusChanged: {
        console.log("focus is changed: " + focus)

        if ( focus ) {
            z = 100
            input.focus = true
        } else {
            z = 0
            input.focus = false
        }
    }

    SortFilterModel {
        id: filter
        model: root.model
        sort.property: term
        sort.order: Qt.AscendingOrder
        filter.property: term
        filter.pattern: {
            return new RegExp(input.text.trim(), "i");
        }
    }

    FocusScope {
        anchors.fill: parent

        TextField {
            id: input
            anchors.horizontalCenter: parent.horizontalCenter
            width: root.width *.8
            placeholderText: "Please input a word"
            focus: true
            inputMethodHints: Qt.ImhNoPredictiveText
            onTextChanged: {
                filter.filter.pattern = new RegExp(input.text.trim(), "i");
            }
        }

        Rectangle {
            id: background
            anchors {
               top: view.top
               bottom: view.bottom
               left:view.left
               right:view.right
            }

            visible: view.visible
            color: "white"
        }

        ListView {
            id: view
            clip: true
            anchors.top: input.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: input.width
            visible: enabled && input.text.length > 0 && input.focus
            height: enabled && input.text.length > 0 && input.focus ? view.childrenRect.height : 0

            model: filter

            delegate:  Label {
                width: parent.width
                text: modelData
                fontSize: "large"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("something is clicked!")
                        input.text = modelData;
                    }
                }
            }
        }
    }
}
