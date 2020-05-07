#include "raylib_pb_helper.h"

void pbhelper_DrawTextureQuad(Texture2D* texture, Vector2* tiling, Vector2* offset, Rectangle* quad, Color tint) {
    if( texture && tiling && offset && quad ) DrawTextureQuad(*texture, *tiling, *offset, *quad, tint);
}
