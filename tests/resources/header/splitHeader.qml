/*
 * Copyright (C) 2015 Canonical Ltd.
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

MainView {
    id: mainView
    width: units.gu(120)
    height: units.gu(60)

    Page {
        title: "Split Header"

        head {
            // FIXME: this doesn't work?
            locked: true
            visible: true
        }

        SplitHeader {
            anchors {
//                centerIn: parent
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            height: units.gu(10) // TODO: auto

            widths: [units.gu(30), units.gu(50), units.gu(25)]
            configurations: [
                PageHeadConfiguration {
                    title: "With sections"
                    actions: [
                        Action {
                            iconName: "like"
                            text: "Like"
                        },
                        Action {
                            iconName: "lock"
                            text: "Lock"
                        }
                    ]
                    sections.actions: [
                        Action {
                            text: "first"
                        },
                        Action {
                            text: "second"
                        },
                        Action {
                            text: "third"
                        }
                    ]
                },
                PageHeadConfiguration {
                    title: "With actions overflow"
                    actions: [
                        Action {
                            iconName: "alarm-clock"
                            text: "Tick tock"
                        },
                        Action {
                            iconName: "appointment"
                            text: "Date"
                        },
                        Action {
                            iconName: "attachment"
                            text: "Attach"
                        },
                        Action {
                            iconName: "contact"
                            text: "Contact"
                        },
                        Action {
                            iconName: "alarm-clock"
                            text: "Tick tock"
                        },
                        Action {
                            iconName: "appointment"
                            text: "Date"
                        }
                    ]
                },
                PageHeadConfiguration {
                    title: "Basic"
                    actions: [
                        Action {
                            iconName: "attachment"
                            text: "Attach"
                        },
                        Action {
                            iconName: "contact"
                            text: "Contact"
                        }
                    ]
                }
            ]
        }
    }
}
