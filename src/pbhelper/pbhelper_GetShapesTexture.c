#include "raylib_pb_helper.h"

void pbhelper_GetShapesTexture(Texture2D* result) {
    if( result ) *result = GetShapesTexture();
}
