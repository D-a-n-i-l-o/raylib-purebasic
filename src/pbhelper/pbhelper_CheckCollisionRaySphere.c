#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionRaySphere(Ray* ray, Vector3* center, float radius) {
    if( ray && center ) return CheckCollisionRaySphere(*ray, *center, radius);
    return false;
}
