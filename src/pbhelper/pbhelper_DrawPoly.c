#include "raylib_pb_helper.h"

void pbhelper_DrawPoly(Vector2* center, int sides, float radius, float rotation, Color color) {
    if( center ) DrawPoly(*center, sides, radius, rotation, color);
}
