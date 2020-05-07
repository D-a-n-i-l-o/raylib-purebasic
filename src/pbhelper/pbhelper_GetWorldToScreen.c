#include "raylib_pb_helper.h"

void pbhelper_GetWorldToScreen(Vector2* result, Vector3* position, Camera* camera) {
    if( result && position && camera ) *result = GetWorldToScreen(*position,*camera);
}
