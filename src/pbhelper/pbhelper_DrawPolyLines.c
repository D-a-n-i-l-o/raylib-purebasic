#include "raylib_pb_helper.h"

void pbhelper_DrawPolyLines(Vector2* center, int sides, float radius, float rotation, Color color) {
    if( center ) DrawPolyLines(*center, sides, radius, rotation, color);
}
