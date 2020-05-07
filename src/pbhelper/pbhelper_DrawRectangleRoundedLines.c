#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleRoundedLines(Rectangle* rect, float roundness, int segments, int lineThick, Color color) {
    if( rect ) DrawRectangleRoundedLines(*rect, roundness, segments, lineThick, color);
}
