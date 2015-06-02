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

/*!
    \qmltype Sections
    \inqmlmodule Ubuntu.Components 1.3
    \ingroup ubuntu
    \since Ubuntu.Components 1.3
    \brief Display a list of sections that the user can select. By tapping
        on a section name the \l selectedIndex will be updated, and the
        associated \l Action is triggered.
 */
StyledItem {
    id: sections
    styleName: "SectionsStyle"

    /*!
      List of actions that represent the sections.
      The text of each action is displayed as the section name and clicking
      a section will update the \selectedIndex.

      When \l selectedIndex is changed (by user interaction or by setting
      the value), \l Action actions[selectedIndex] will be triggered.

      Example:
      \qml
        Sections {
            actions: [
                Action { text: "first" },
                Action { text: "second" },
                Action { text: "third" }
            ]
            onSelectedIndexChanged: {
                print("Selected " + actions[selectedIndex].text + " section.");
            }
        }
     \endqml
     It is strongly recommended to limit the number of sections to two or three.
     */
    property var actions
    onActionsChanged: {
        if (actions && actions.length > 3) {
            // FIXME: Make the Sections scrollable for more than 3 sections.
            console.warn("It is not YET recommended or supported to use more than three sections.");
        }
    }

    /*!
      The index of the currently selected section in \l model.
     */
    property int selectedIndex: actions ? 0 : -1

    onSelectedIndexChanged: {
        if ((selectedIndex >= 0) && (selectedIndex < actions.length)) {
            actions[selectedIndex].trigger();
        }
    }
}