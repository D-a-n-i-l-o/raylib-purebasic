#include "raylib_pb_helper.h"

void pbhelper_GenImageFontAtlas(Image* result, const CharInfo *chars, Rectangle **recs, int charsCount, int fontSize, int padding, int packMethod) {
    if( result && chars && recs ) *result = GenImageFontAtlas(chars, recs, charsCount, fontSize, padding, packMethod);
}
