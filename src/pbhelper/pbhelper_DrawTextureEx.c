#include "raylib_pb_helper.h"

void pbhelper_DrawTextureEx(Texture2D* texture, Vector2* position, float rotation, float scale, Color tint) {
    if( texture && position ) DrawTextureEx(*texture, *position, rotation, scale, tint);
}
