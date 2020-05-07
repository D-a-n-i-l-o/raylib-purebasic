#include "raylib_pb_helper.h"

void pbhelper_ImageDrawPixelV(Image *dst, Vector2* position, Color color) {
    if( dst && position ) ImageDrawPixelV(dst, *position, color);
}
