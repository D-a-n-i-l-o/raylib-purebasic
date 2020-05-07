#include "raylib_pb_helper.h"

void pbhelper_DrawTextureNPatch(Texture2D* texture, NPatchInfo* nPatchInfo, Rectangle* destRec, Vector2* origin, float rotation, Color tint) {
    if( texture && nPatchInfo && destRec && origin ) DrawTextureNPatch(*texture, *nPatchInfo, *destRec, *origin, rotation, tint);
}
