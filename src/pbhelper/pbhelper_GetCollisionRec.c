#include "raylib_pb_helper.h"

void pbhelper_GetCollisionRec(Rectangle* result, Rectangle* rect1, Rectangle* rect2) {
    if( result && rect1 && rect2 ) *result = GetCollisionRec(*rect1,*rect2);
}
