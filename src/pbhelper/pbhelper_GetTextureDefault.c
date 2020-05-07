#include "raylib_pb_helper.h"

void pbhelper_GetTextureDefault(Texture2D* result) {
    if( result ) *result = GetTextureDefault();
}
