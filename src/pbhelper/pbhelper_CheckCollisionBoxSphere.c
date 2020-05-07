#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionBoxSphere(BoundingBox* box, Vector3* center, float radius) {
    if( box && center ) return CheckCollisionBoxSphere(*box, *center, radius);
    return false;
}
