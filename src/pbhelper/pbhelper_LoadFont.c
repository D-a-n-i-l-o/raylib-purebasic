#include "raylib_pb_helper.h"

void pbhelper_LoadFont(Font* result, const char *fileName) {
    if( result && fileName ) *result = LoadFont(fileName);
}
