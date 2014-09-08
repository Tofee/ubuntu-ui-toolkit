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

import QtQuick 2.2
import Ubuntu.Components 1.1

// documentation in UbuntuListView11.qdoc
UbuntuListView {

    /*!
      \internal
      \qmlproperty PullToRefresh pullToRefresh
      */
    property alias pullToRefresh: refreshItem

    /*!
      \internal
      \qmlproperty Action deleteAction
      */
    property Action deleteAction: Action {
        iconName: "delete"
        onTriggered: {
            // delete the index from model if possible
        }
    }

    /*!
      \internal
      \qmlproperty ListItemOptions leadingOptions
      Use binding so we can set it to each ListItem as binding!
      */
    property ListItemOptions leadingOptions: stockLeadingOption
    ListItemOptions {
        id: stockLeadingOption
        options: [deleteAction]
    }

    PullToRefresh {
        objectName: "listview_pulltorefresh"
        id: refreshItem
        enabled: false
    }
}
