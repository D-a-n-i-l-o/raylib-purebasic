#include "raylib_pb_helper.h"

void pbhelper_DrawPlane(Vector3* centerPos, Vector2* size, Color color) {
    if( centerPos && size ) DrawPlane(*centerPos, *size, color);
}
