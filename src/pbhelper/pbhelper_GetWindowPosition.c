#include "raylib_pb_helper.h"

void pbhelper_GetWindowPosition(Vector2* result) {
    if( result ) *result = GetWindowPosition();
}
