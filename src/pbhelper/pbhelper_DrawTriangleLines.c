#include "raylib_pb_helper.h"

void pbhelper_DrawTriangleLines(Vector2* v1, Vector2* v2, Vector2* v3, Color color) {
    if( v1 && v2 && v3 ) DrawTriangleLines(*v1, *v2, *v3, color);
}
