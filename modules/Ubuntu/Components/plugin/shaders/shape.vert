// Copyright © 2014 Canonical Ltd.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; version 3.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// Author: Loïc Molinari <loic.molinari@canonical.com>

uniform mediump mat4 matrix;
uniform lowp bool textured;

attribute mediump vec4 positionAttrib;
attribute mediump vec2 shapeCoordAttrib;
attribute mediump vec4 sourceCoordAttrib;
attribute lowp vec4 backgroundColorAttrib;

// FIXME(loicm) Optimize by reducing/packing varyings.
varying mediump vec2 shapeCoord;
varying mediump vec4 sourceCoord;
varying lowp vec4 backgroundColor;

void main()
{
    shapeCoord = shapeCoordAttrib;

    // FIXME(loicm) Would be better to use a bitfield but bitwise ops have only been integrated in
    //     GLSL 1.3 (OpenGL 3) and GLSL ES 3 (OpenGL ES 3).
    if (textured) {
        sourceCoord = sourceCoordAttrib;
    }

    backgroundColor = backgroundColorAttrib;

    gl_Position = matrix * positionAttrib;
}