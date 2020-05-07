#include "raylib_pb_helper.h"

void pbhelper_ImageDrawText(Image *dst, Vector2* position, const char *text, int fontSize, Color color) {
    if( dst && position && text ) ImageDrawText(dst, *position, text, fontSize, color);
}
