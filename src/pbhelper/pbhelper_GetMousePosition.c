#include "raylib_pb_helper.h"

void pbhelper_GetMousePosition(Vector2* result) {
    if( result ) *result = GetMousePosition();
}
