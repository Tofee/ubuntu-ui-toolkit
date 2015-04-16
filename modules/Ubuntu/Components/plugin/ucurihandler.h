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
 *
 * Author: Loïc Molinari <loic.molinari@canonical.com>
 */

#include <QtCore/QObject>
#include <QtCore/QStringList>

class UCUriHandler;

class UriHandlerObject : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface", "org.freedesktop.Application")

 public:
    UriHandlerObject(UCUriHandler* uriHandler);

 public Q_SLOTS:
    void Open(const QStringList& uris, const QHash<QString, QVariant>& platformData);
    void handOverCachedUris();

 private:
    UCUriHandler* m_uriHandler;
    QStringList m_uris;
    bool m_cacheUris:1;
    friend class UCUriHandler;
};

class UCUriHandler : public QObject
{
    Q_OBJECT

 public:
    UCUriHandler();

 Q_SIGNALS:
    void opened(const QStringList& uris);

 private:
    UriHandlerObject m_uriHandlerObject;
};
