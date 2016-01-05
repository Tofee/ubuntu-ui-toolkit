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
import Ubuntu.Components.Themes 1.3

PaletteValues {
    background: "#FFFFFF"
    backgroundText: UbuntuColors.lacquer
    backgroundSecondaryText: UbuntuColors.darkGrey
    backgroundTertiaryText: UbuntuColors.ash
    base: UbuntuColors.lightGrey
    baseText: UbuntuColors.darkGrey
    foreground: UbuntuColors.porcelain
    foregroundText: UbuntuColors.lacquer
    raised: "#FFFFFF"
    raisedText: UbuntuColors.darkGrey
    raisedSecondaryText: UbuntuColors.lightGrey
    overlay: "#FFFFFF"
    overlayText: UbuntuColors.darkGrey
    overlaySecondaryText: UbuntuColors.lightGrey
    field: "#FFFFFF"
    fieldText: UbuntuColors.lacquer
    selection: Qt.rgba(UbuntuColors.orange.r, UbuntuColors.orange.g, UbuntuColors.orange.b, 0.2)
    selectionText: UbuntuColors.lacquer
    positive: UbuntuColors.green
    positiveText: "#FFFFFF"
    negative: UbuntuColors.red
    negativeText: "#FFFFFF"
    activity: UbuntuColors.blue
    activityText: "#FFFFFF"
}
