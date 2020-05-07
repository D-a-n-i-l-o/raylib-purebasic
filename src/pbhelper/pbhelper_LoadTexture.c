#include "raylib_pb_helper.h"

void pbhelper_LoadTexture(Texture2D* result, const char *fileName) {
    if( result && fileName ) *result = LoadTexture(fileName);
}
