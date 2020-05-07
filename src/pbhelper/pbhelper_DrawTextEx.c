#include "raylib_pb_helper.h"

void pbhelper_DrawTextEx(Font* font, const char *text, Vector2* position, float fontSize, float spacing, Color tint) {
    if( font && text && position) DrawTextEx(*font, text, *position, fontSize, spacing, tint);
}
