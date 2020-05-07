#include "raylib_pb_helper.h"

void pbhelper_GetScreenToWorld2D(Vector2* result, Vector2* position, Camera2D* camera) {
    if( result && position && camera ) *result = GetScreenToWorld2D(*position, *camera);
}
