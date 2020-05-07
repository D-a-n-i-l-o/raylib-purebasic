#include "raylib_pb_helper.h"

void pbhelper_GetGesturePinchVector(Vector2* result) {
    if( result ) *result = GetGesturePinchVector();
}
