/*
 * Copyright 2014 Canonical Ltd.
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

Item {
    id: component1
    objectName: "TopItem"
    width: units.gu(50)
    height: units.gu(100)

    Column {
        objectName: "Column"
        anchors.fill: parent
        Label {
            text: "Hallo"
        }
        Button {
            text: "Theme change"
            onClicked: Theme.name = "Ubuntu.Components.Themes.SuruDark"
        }

        TextField {
            objectName: "OuterText"
            property string styleName: Theme.name
            onStyleNameChanged: print(objectName, styleName)
        }
        StyledItem {
            objectName: "SuruDarkStyled"
            width: parent.width
            height: units.gu(10)
            styleSet: StyleSet {
                name: "Ubuntu.Components.Themes.SuruDark"
                // override normal.foregroundText
                PaletteChanges {
                    values: "normal"
                    foregroundText: UbuntuColors.blue
                    normal.overlayText: "blue"
                }
            }

            TextField {
                objectName: "InnerText"
                property string styleName: styleSet.name
                onStyleNameChanged: print(objectName, styleName)
            }
        }
    }
}