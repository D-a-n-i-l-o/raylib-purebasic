#include "raylib_pb_helper.h"

void pbhelper_DrawSphereWires(Vector3* centerPos, float radius, int rings, int slices, Color color) {
    if( centerPos ) DrawSphereWires(*centerPos, radius, rings, slices, color);
}
