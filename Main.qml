import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "combobox.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("combobox")

        Image {
            anchors.fill: parent
            source: "images/pic.jpg"
        }

        ListModel {
            id: mymodel

            ListElement {
                name: "apples"
            }
            ListElement {
                name: "pears"
            }
            ListElement {
                name: "oranges"
            }
            ListElement {
                name: "grapes"
            }
            ListElement {
                name: "baidu"
            }
            ListElement {
                name: "mango"
            }
            ListElement {
                name: "pineapple"
            }
            ListElement {
                name: "date"
            }
            ListElement {
                name: "watermelon"
            }
        }

        Column {
            anchors.fill: parent
            spacing: units.gu(2)

            ComboBox {
                model: mymodel
                term: "name"
                height: units.gu(5)
            }

            ComboBox {
                model: mymodel
                term: "name"
                height: units.gu(5)
            }

        }
    }
}

