#include "raylib_pb_helper.h"

void pbhelper_DrawTextCodepoint(Font* font, int codepoint, Vector2* position, float scale, Color tint) {
    if( font && position ) DrawTextCodepoint(*font, codepoint, *position, scale, tint);
}
