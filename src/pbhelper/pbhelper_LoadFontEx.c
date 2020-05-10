#include "raylib_pb_helper.h"

void pbhelper_LoadFontEx(Font* result, const char *fileName, int fontSize, int *fontChars, int charsCount) {
    // fontChars can be 0, don't check!
    if( result && fileName ) *result = LoadFontEx(fileName, fontSize, fontChars, charsCount);
}
