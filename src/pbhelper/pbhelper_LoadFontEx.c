#include "raylib_pb_helper.h"

void pbhelper_LoadFontEx(Font* result, const char *fileName, int fontSize, int *fontChars, int charsCount) {
    if( result && fileName && fontChars ) *result = LoadFontEx(fileName, fontSize, fontChars, charsCount);
}
