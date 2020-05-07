#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionPointRec(Vector2* point, Rectangle* rect) {
    if( point && rect ) return CheckCollisionPointRec(*point, *rect);
    return false;
}
