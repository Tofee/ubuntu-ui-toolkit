/*
 * Copyright 2016 Canonical Ltd.
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

#ifndef SHAPEUTILS_H
#define SHAPEUTILS_H

#include <QtQuick/QSGMaterial>
#include <QtGui/QColor>

// FIXME(loicm) Add and clean up code generators in the tools folder.

#if defined(Q_CC_GNU)
#define RESTRICT __restrict__
#elif defined(Q_CC_MSVC)
#define RESTRICT __restrict
#else
#define RESTRICT
#endif

// FIXME(loicm) Remove and use Q_ASSERT before shipping.
#define DASSERT(x) do { if (!(x)) { qFatal("assertion failed at %d\n", __LINE__); } } while(0)

// --- Shared data ---

const int defaultRadius = 50;
const int maxRadius = 128;
const int textureStride = 32;

// Squircle SVG string.
extern const char squircleSvg[];

// Squircle signed distance field.
const float squircleOffset = 1.0f;
const int squircleSdfWidth = 32;
extern const float squircleSdf[][squircleSdfWidth];

// Gaussian kernels. Changing one field requires an update of the others, use
// the appropriate tool in the tools folder.
const int gaussianCount = 128;
extern const int gaussianOffsets[];
extern const float gaussianKernels[];
extern const float gaussianSums[];

// --- Shared code ---

class UCOpaqueColorMaterial : public QSGMaterial
{
public:
    UCOpaqueColorMaterial();
    virtual int compare(const QSGMaterial* other) const;
    virtual QSGMaterialType* type() const;
    virtual QSGMaterialShader* createShader() const;
};

class UCColorMaterial : public UCOpaqueColorMaterial
{
public:
    UCColorMaterial();
    virtual QSGMaterialType* type() const;
    virtual QSGMaterialShader* createShader() const;
};

// Get the stride of a buffer of the given width and bytes per pixel for a
// specific alignment.
// FIXME(loicm) The bytesPerPixel thing seems broken.
static inline int getStride(int width, int bytesPerPixel, int alignment)
{
    DASSERT(!(bytesPerPixel & (bytesPerPixel - 1)));  // Power-of-two
    DASSERT(!(alignment & (alignment - 1)));          // Power-of-two
    return ((width * bytesPerPixel + alignment - 1) & ~(alignment - 1)) / bytesPerPixel;
}

// Pack a color in a premultiplied ABGR32 value.
static inline quint32 packColor(QRgb color)
{
    const quint32 a = qAlpha(color);
    const quint32 b = ((qBlue(color) * a) + 0xff) >> 8;
    const quint32 g = ((qGreen(color) * a) + 0xff) >> 8;
    const quint32 r = ((qRed(color) * a) + 0xff) >> 8;
    return (a << 24) | ((b & 0xff) << 16) | ((g & 0xff) << 8) | (r & 0xff);
}

#endif  // SHAPEUTILS_H
