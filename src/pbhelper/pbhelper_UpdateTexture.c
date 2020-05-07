#include "raylib_pb_helper.h"

void pbhelper_UpdateTexture(Texture2D* texture, const void *pixels) {
    if( texture && pixels ) UpdateTexture(*texture, pixels);
}
