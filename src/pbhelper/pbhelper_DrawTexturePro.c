#include "raylib_pb_helper.h"

void pbhelper_DrawTexturePro(Texture2D* texture, Rectangle* sourceRec, Rectangle* destRec, Vector2* origin, float rotation, Color tint) {
    if( texture && sourceRec && destRec && origin ) DrawTexturePro(*texture, *sourceRec, *destRec, *origin, rotation, tint);
}
