#include "raylib_pb_helper.h"

void pbhelper_DrawPixelV(Vector2* position, Color color) {
    if( position ) DrawPixelV(*position, color);
}
