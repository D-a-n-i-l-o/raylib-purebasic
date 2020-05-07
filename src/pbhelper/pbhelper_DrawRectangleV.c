#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleV(Vector2* position, Vector2* size, Color color) {
    if( position && size ) DrawRectangleV(*position, *size, color);
}
