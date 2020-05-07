#include "raylib_pb_helper.h"

void pbhelper_GetCollisionRayTriangle(RayHitInfo* result, Ray* ray, Vector3* p1, Vector3* p2, Vector3* p3) {
    if( result && ray && p1 && p2 && p3 ) *result = GetCollisionRayTriangle(*ray, *p1, *p2, *p3);
}
