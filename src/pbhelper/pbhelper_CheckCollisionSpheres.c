#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionSpheres(Vector3* centerA, float radiusA, Vector3* centerB, float radiusB) {
    if( centerA && centerB ) return CheckCollisionSpheres(*centerA, radiusA, *centerB, radiusB);
    return false;
}
