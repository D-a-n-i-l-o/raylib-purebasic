#include "raylib_pb_helper.h"

void pbhelper_DrawRectanglePro(Rectangle* rect, Vector2* origin, float rotation, Color color) {
    if( rect && origin ) DrawRectanglePro(*rect, *origin, rotation, color);
}
