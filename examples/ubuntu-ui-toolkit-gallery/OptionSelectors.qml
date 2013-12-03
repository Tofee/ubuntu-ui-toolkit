/*
 * Copyright 2013 Canonical Ltd.
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

import QtQuick 2.0
import Ubuntu.Components 0.1

Template {
    TemplateSection {
        title: i18n.tr("Option Selector")
        className: "Option Selector"

        Column {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: units.gu(3)

            OptionSelector {
               objectName: "optionselector_collapsed"
               text: i18n.tr("Collapsed")
                model: [i18n.tr("Value 1"),
                        i18n.tr("Value 2"),
                        i18n.tr("Value 3"),
                        i18n.tr("Value 4")]
            }

            OptionSelector {
                objectName: "optionselector_expanded"
                text: i18n.tr("Expanded")
                expanded: true
                model: [i18n.tr("Value 1"),
                        i18n.tr("Value 2"),
                        i18n.tr("Value 3"),
                        i18n.tr("Value 4")]
            }

            OptionSelector {
               objectName: "optionselector_custommodel"
               text: i18n.tr("Multiple Selection Custom Model")
                model: customModel
                expanded: true
                colourImage: true
                multiSelection: true
                delegate: selectorDelegate

                Component.onCompleted: {
                    //Print out our radio roles which are bound to the delegate's selected property.
                    for (var i = 0; i < model.count; i++) {
                        print(model.get(i).radio);
                    }

                    //Reset our first delegate's radio role which was bound as true. This change is reflected in our UI.
                    model.setProperty(0, "radio", false);
                }

                onDelegateClicked: {
                    model.setProperty(index, "radio", !model.get(index).radio);
                    print("SELECTED: " + model.get(index).radio);
                }
            }

            Component {
                id: selectorDelegate
                OptionSelectorDelegate { text: name; subText: description; iconSource: image; selected: radio }
            }

            ListModel {
                id: customModel
                ListElement { name: "Name 1"; description: "Description 1"; image: "images.png"; radio: true }
                ListElement { name: "Name 2"; description: "Description 2"; image: "images.png"; radio: false }
                ListElement { name: "Name 3"; description: "Description 3"; image: "images.png"; radio: true }
                ListElement { name: "Name 4"; description: "Description 4"; image: "images.png"; radio: false }
            }

            OptionSelector {
                text: i18n.tr("Label")
                model: [i18n.tr("Value 1"),
                        i18n.tr("Value 2"),
                        i18n.tr("Value 3"),
                        i18n.tr("Value 4"),
                        i18n.tr("Value 5"),
                        i18n.tr("Value 6"),
                        i18n.tr("Value 7"),
                        i18n.tr("Value 8")]
                containerHeight: itemHeight * 4
            }

            OptionSelector {
                text: i18n.tr("Label")
                expanded: true
                selectedIndex: -1
                model: [i18n.tr("Value 1"),
                        i18n.tr("Value 2"),
                        i18n.tr("Value 3"),
                        i18n.tr("Value 4"),
                        i18n.tr("Value 5"),
                        i18n.tr("Value 6"),
                        i18n.tr("Value 7"),
                        i18n.tr("Value 8")]
                containerHeight: itemHeight * 4
            }
        }
    }
}
