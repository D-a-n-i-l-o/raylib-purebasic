#include "raylib_pb_helper.h"

void pbhelper_GetWorldToScreenEx(Vector2* result, Vector3* position, Camera* camera,  int width, int height) {
    if( result && position && camera ) *result = GetWorldToScreenEx(*position, *camera, width, height);
}
