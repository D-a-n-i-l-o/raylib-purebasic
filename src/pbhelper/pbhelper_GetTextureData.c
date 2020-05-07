#include "raylib_pb_helper.h"

void pbhelper_GetTextureData(Image* result, Texture2D* texture) {
    if( result && texture ) *result = GetTextureData(*texture);
}
