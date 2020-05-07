#include "raylib_pb_helper.h"

void pbhelper_DrawRingLines(Vector2* center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color) {
    if( center) DrawRingLines(*center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
}
