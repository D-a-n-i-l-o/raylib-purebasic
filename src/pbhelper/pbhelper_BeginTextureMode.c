#include "raylib_pb_helper.h"

void pbhelper_BeginTextureMode(RenderTexture2D* target) {
    if( target ) BeginTextureMode(*target);
}
