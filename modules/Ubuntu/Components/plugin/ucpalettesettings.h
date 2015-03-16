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
 * Author: Zsombor Egri <zsombor.egri@canonical.com>
 */

#ifndef UCPALETTESETTINGS_H
#define UCPALETTESETTINGS_H

#include <QtCore/QObject>

#define foreach Q_FOREACH
#include <QtQml/private/qqmlcustomparser_p.h>
#include <private/qv4engine_p.h>
#include <private/qpodvector_p.h>
#undef foreach
#include <QtQml/private/qqmlcompiler_p.h>

class UCPaletteSettingsParser;

class UCTheme;
class UCPaletteSettings : public QObject, public QQmlParserStatus
{
    Q_OBJECT
    Q_INTERFACES(QQmlParserStatus)
    Q_PROPERTY(bool explicit MEMBER m_explicit NOTIFY explicitChanged FINAL)
public:
    explicit UCPaletteSettings(QObject *parent = 0);

    UCTheme *theme();
    QObject *palette();
    QObject *valueSet(const QString &name);

    void applyProperty(QObject *valueSet, const QString &propertyPrefix, const QV4::CompiledData::Unit *qmlUnit, const QV4::CompiledData::Binding *binding);

Q_SIGNALS:
    void explicitChanged();

private Q_SLOTS:
    void _q_applyPaletteSettings();

protected:
    void classBegin();
    void componentComplete();

private:

    class Expression {
    public:
        Expression(const QString &name, QQmlBinding::Identifier id, const QString& expr,
                         const QUrl &url, int line, int column)
            : name(name), id(id), expression(expr), url(url), line(line), column(column) {}
        QString name;
        QQmlBinding::Identifier id;
        QString expression;
        QUrl url;
        int line;
        int column;
    };

    bool m_decoded:1;
    bool m_explicit:1;
    QList< QPair<QString, QString> > m_values;
    QList<Expression> m_expressions;
    // from parser
    QQmlRefPointer<QQmlCompiledData> m_cdata;

    friend class UCPaletteSettingsParser;
};

class UCPaletteSettingsParser : public QQmlCustomParser
{
public:
    UCPaletteSettingsParser() : QQmlCustomParser(QQmlCustomParser::AcceptsSignalHandlers) {}

    virtual void verifyBindings(const QV4::CompiledData::Unit *qmlUnit, const QList<const QV4::CompiledData::Binding *> &bindings);
    virtual void applyBindings(QObject *obj, QQmlCompiledData *cdata, const QList<const QV4::CompiledData::Binding *> &bindings);

private:
    void verifyProperty(const QV4::CompiledData::Unit *qmlUnit, const QV4::CompiledData::Binding *binding);
};

#endif // UCPALETTESETTINGS_H