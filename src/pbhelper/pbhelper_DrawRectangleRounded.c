#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleRounded(Rectangle* rect, float roundness, int segments, Color color) {
    if( rect ) DrawRectangleRounded(*rect, roundness, segments, color);
}
