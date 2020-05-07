#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionRecs(Rectangle* rect1, Rectangle* rect2) {
    if( rect1 && rect2 ) return CheckCollisionRecs(*rect1, *rect2);
    return false;
}
