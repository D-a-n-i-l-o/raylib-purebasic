#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionRaySphereEx(Ray* ray, Vector3* center, float radius, Vector3 *collisionPoint) {
    if( ray && center && collisionPoint ) return CheckCollisionRaySphereEx(*ray, *center, radius, collisionPoint);
    return false;
}
