#include "raylib_pb_helper.h"

void pbhelper_GetGestureDragVector(Vector2* result) {
    if( result ) *result = GetGestureDragVector();
}
