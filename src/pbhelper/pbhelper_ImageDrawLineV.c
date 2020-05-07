#include "raylib_pb_helper.h"

void pbhelper_ImageDrawLineV(Image *dst, Vector2* start, Vector2* end, Color color) {
    if( dst && start && end ) ImageDrawLineV(dst, *start, *end, color);
}
