#include "raylib_pb_helper.h"

void pbhelper_LoadRenderTexture(RenderTexture2D* result, int width, int height) {
    if( result ) *result = LoadRenderTexture(width,height);
}
