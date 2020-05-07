#include "raylib_pb_helper.h"

void pbhelper_UnloadRenderTexture(RenderTexture2D* target) {
    if( target ) UnloadRenderTexture(*target);
}
