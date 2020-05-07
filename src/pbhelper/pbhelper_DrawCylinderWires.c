#include "raylib_pb_helper.h"

void pbhelper_DrawCylinderWires(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color color) {
    if( position ) DrawCylinderWires(*position, radiusTop, radiusBottom, height, slices, color);
}
