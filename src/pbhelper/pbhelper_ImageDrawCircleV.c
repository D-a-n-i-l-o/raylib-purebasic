#include "raylib_pb_helper.h"

void pbhelper_ImageDrawCircleV(Image *dst, Vector2* center, int radius, Color color) {
    if( dst && center) ImageDrawCircleV(dst, *center, radius, color);
}
