#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionBoxes(BoundingBox* box1, BoundingBox* box2) {
    if( box1 && box2 ) return CheckCollisionBoxes(*box1, *box2);
    return false;
}
