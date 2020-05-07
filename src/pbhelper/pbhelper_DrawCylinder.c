#include "raylib_pb_helper.h"

void pbhelper_DrawCylinder(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color color) {
    if( position ) DrawCylinder(*position, radiusTop, radiusBottom, height, slices, color);
}
