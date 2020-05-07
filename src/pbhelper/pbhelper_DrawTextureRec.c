#include "raylib_pb_helper.h"

void pbhelper_DrawTextureRec(Texture2D* texture, Rectangle* sourceRec, Vector2* position, Color tint) {
    if( texture && sourceRec && position ) DrawTextureRec(*texture, *sourceRec, *position, tint);
}
