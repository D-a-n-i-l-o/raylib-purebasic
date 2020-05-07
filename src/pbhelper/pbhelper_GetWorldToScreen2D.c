#include "raylib_pb_helper.h"

void pbhelper_GetWorldToScreen2D(Vector2* result, Vector2* position, Camera2D* camera) {
    if( result && position && camera ) *result = GetWorldToScreen2D(*position, *camera);
}
