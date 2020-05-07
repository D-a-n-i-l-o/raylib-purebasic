#include "raylib_pb_helper.h"

void pbhelper_DrawBillboard(Camera* camera, Texture2D* texture, Vector3* center, float size, Color tint) {
    if( camera && texture && center ) DrawBillboard(*camera, *texture, *center, size, tint);
}
