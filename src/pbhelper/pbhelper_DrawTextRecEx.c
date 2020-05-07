#include "raylib_pb_helper.h"

void pbhelper_DrawTextRecEx(Font* font, const char *text, Rectangle* rec, float fontSize, float spacing, bool wordWrap, Color tint,
                            int selectStart, int selectLength, Color selectTint, Color selectBackTint) {
    if( font && text && rec) DrawTextRecEx(*font, text, *rec, fontSize, spacing, wordWrap, tint,
                                           selectStart, selectLength, selectTint, selectBackTint);
}
