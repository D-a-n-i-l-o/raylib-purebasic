#include "raylib_pb_helper.h"

void pbhelper_GetTouchPosition(Vector2* result, int index) {
    if( result ) *result = GetTouchPosition(index);
}
