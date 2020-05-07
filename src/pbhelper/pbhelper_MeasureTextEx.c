#include "raylib_pb_helper.h"

void pbhelper_MeasureTextEx(Vector2* result, Font* font, const char *text, float fontSize, float spacing) {
    if( result && font && text ) *result = MeasureTextEx(*font, text, fontSize, spacing);
}
