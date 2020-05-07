#include "raylib_pb_helper.h"

void pbhelper_ImageDrawTextEx(Image *dst, Vector2* position, Font* font, const char *text, float fontSize, float spacing, Color color) {
    if( dst && position && font && text ) ImageDrawTextEx(dst, *position, *font, text, fontSize, spacing, color);
}
