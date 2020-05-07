#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionRayBox(Ray* ray, BoundingBox* box) {
    if( ray && box ) return CheckCollisionRayBox(*ray, *box);
    return false;
}
