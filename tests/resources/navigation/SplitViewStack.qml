/*
 * Copyright 2015 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.1

MainView {
    id: main
    width: units.gu(100)
    height: units.gu(71)

    MultiColumnView {
        id: view
        anchors.fill: parent
        columns: {
            if (width > units.gu(120)) return 3;
            if (width > units.gu(80)) return 2;
            return 1;
        }
        columnMetrics: [
            ColumnMetrics {
                column: 2
                fillWidth: true
            },
            ColumnMetrics {
                column: 3
                fillWidth: false
                minimumWidth: units.gu(50)
            }
        ]
        primaryPage: page1

        Page {
            id: page1
            title: "Page #1"

            Rectangle {
                anchors.fill: parent
                color: "red"
            }
            Column {
                Button {
                    text: "Add page2 next"
                    onClicked: page1.pageStack.addPageToNextColumn(page1, page2)
                }
                Button {
                    text: "Add page4 above"
                    onClicked: page1.pageStack.addPageToCurrentColumn(page1, page4)
                }
            }
        }

        Page {
            id: page2
            title: "Page #2"

            Rectangle {
                anchors.fill: parent
                color: "green"
            }
            Column {
                Button {
                    text: "Back..."
                    onClicked: page2.pageStack.removePages(page2)
                }
                Button {
                    text: "Add page3 next"
                    onClicked: page2.pageStack.addPageToNextColumn(page2, page3)
                }
            }
        }
        Page {
            id: page3
            title: "Page #3"

            Rectangle {
                anchors.fill: parent
                color: "blue"
            }
            Button {
                text: "Back..."
                onClicked: page3.pageStack.removePages(page3)
            }
        }
        Page {
            id: page4
            title: "Page #4"

            Rectangle {
                anchors.fill: parent
                color: "teal"
            }
            Column {
                Button {
                    text: "Back..."
                    onClicked: page4.pageStack.removePages(page4)
                }
                Button {
                    text: "Add page5 next"
                    onClicked: page4.pageStack.addPageToNextColumn(page4, page5)
                }
            }
        }
        Page {
            id: page5
            title: "Page #5"
            Rectangle {
                anchors.fill: parent
                color: "tan"
            }
            Column {
                Button {
                    text: "Back..."
                    onClicked: page5.pageStack.removePages(page5)
                }
                Button {
                    text: "Custom page on same column"
                    onClicked: page5.pageStack.addPageToCurrentColumn(page5, Qt.resolvedUrl("MyCustomPage.qml"))
                }
            }
        }
    }
}