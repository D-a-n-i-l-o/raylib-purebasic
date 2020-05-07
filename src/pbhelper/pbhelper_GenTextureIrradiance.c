#include "raylib_pb_helper.h"

void pbhelper_GenTextureIrradiance(Texture2D* result, Shader* shader, Texture2D* cubemap, int size) {
    if( result && shader && cubemap ) *result = GenTextureIrradiance(*shader, *cubemap, size);
}
