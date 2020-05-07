#include "raylib_pb_helper.h"

void pbhelper_DrawTextureV(Texture2D* texture, Vector2* position, Color tint) {
    if( texture && position ) DrawTextureV(*texture, *position, tint);
}
