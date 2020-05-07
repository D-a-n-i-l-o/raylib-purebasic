#include "raylib_pb_helper.h"

void pbhelper_DrawTriangle(Vector2* v1, Vector2* v2, Vector2* v3, Color color) {
    if( v1 && v2 && v3 ) DrawTriangle(*v1, *v2, *v3, color);
}
