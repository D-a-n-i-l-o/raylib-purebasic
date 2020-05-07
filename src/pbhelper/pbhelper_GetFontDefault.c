#include "raylib_pb_helper.h"

void pbhelper_GetFontDefault(Font* result) {
    if( result ) *result = GetFontDefault();
}
