#include "raylib_pb_helper.h"

void pbhelper_ImageDrawRectangleRec(Image *dst, Rectangle* rec, Color color) {
    if( dst && rec ) ImageDrawRectangleRec(dst, *rec, color);
}
