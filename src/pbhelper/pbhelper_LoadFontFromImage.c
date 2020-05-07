#include "raylib_pb_helper.h"

void pbhelper_LoadFontFromImage(Font* result, Image* image, Color key, int firstChar) {
    if( result && image ) *result = LoadFontFromImage(*image, key, firstChar);
}
