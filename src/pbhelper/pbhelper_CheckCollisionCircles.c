#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionCircles(Vector2* center1, float radius1, Vector2* center2, float radius2) {
    if( center1 && center2 ) return CheckCollisionCircles(*center1, radius1, *center2, radius2);
    return false;
}
