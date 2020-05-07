#include "raylib_pb_helper.h"

void pbhelper_DrawLineV(Vector2* startPos, Vector2* endPos, Color color) {
    if( startPos && endPos ) DrawLineV(*startPos, *endPos, color);
}
