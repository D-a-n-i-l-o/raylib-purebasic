#include "raylib_pb_helper.h"

void pbhelper_DrawSphereEx(Vector3* centerPos, float radius, int rings, int slices, Color color) {
    if( centerPos ) DrawSphereEx(*centerPos, radius, rings, slices, color);
}
