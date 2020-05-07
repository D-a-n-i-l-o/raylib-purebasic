#include "raylib_pb_helper.h"

void pbhelper_ImageDrawRectangleLines(Image *dst, Rectangle* rec, int thick, Color color) {
    if (dst && rec ) ImageDrawRectangleLines(dst, *rec, thick, color);
}
