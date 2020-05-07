#include "raylib_pb_helper.h"

void pbhelper_LoadTextureFromImage(Texture2D* result, Image* image) {
    if( result && image ) *result = LoadTextureFromImage(*image);
}
