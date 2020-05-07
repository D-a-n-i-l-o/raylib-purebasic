#include "raylib_pb_helper.h"

void pbhelper_GetCollisionRayModel(RayHitInfo* result, Ray* ray, Model* model) {
    if( result && ray && model ) *result = GetCollisionRayModel(*ray, *model);
}
