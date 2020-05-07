#include "raylib_pb_helper.h"

void pbhelper_DrawTextRec(Font* font, const char *text, Rectangle* rec, float fontSize, float spacing, bool wordWrap, Color tint) {
    if( font && text && rec ) DrawTextRec(*font, text, *rec, fontSize, spacing, wordWrap, tint);
}
