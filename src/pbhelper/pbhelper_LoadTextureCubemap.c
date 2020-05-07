#include "raylib_pb_helper.h"

void pbhelper_LoadTextureCubemap(TextureCubemap* result, Image* image, int layoutType) {
    if( result && image ) *result = LoadTextureCubemap(*image, layoutType);
}
