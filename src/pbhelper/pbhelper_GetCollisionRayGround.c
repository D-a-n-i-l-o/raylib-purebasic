#include "raylib_pb_helper.h"

void pbhelper_GetCollisionRayGround(RayHitInfo* result, Ray* ray, float groundHeight) {
    if( result && ray ) *result = GetCollisionRayGround(*ray, groundHeight);
}
