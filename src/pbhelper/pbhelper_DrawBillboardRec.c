#include "raylib_pb_helper.h"

void pbhelper_DrawBillboardRec(Camera* camera, Texture2D* texture, Rectangle* sourceRec, Vector3* center, float size, Color tint) {
    if( camera && texture && sourceRec && center ) DrawBillboardRec(*camera, *texture, *sourceRec, *center, size, tint);
}
