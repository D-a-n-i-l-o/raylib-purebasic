#include "raylib_pb_helper.h"

void pbhelper_ImageDrawRectangleV(Image *dst, Vector2* position, Vector2* size, Color color) {
    if( dst && position && size) ImageDrawRectangleV(dst, *position, *size, color);
}
