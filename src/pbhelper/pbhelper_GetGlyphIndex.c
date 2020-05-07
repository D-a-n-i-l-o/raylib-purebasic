#include "raylib_pb_helper.h"

int  pbhelper_GetGlyphIndex(Font* font, int codepoint) {
    if( font ) return GetGlyphIndex(*font, codepoint);
    return 0;
}
