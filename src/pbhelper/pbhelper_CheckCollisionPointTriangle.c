#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionPointTriangle(Vector2* point, Vector2* p1, Vector2* p2, Vector2* p3) {
    if( point && p1 && p2 && p3 ) return CheckCollisionPointTriangle(*point, *p1, *p2, *p3);
    return false;
}
