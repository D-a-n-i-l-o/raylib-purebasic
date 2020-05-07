#include "raylib_pb_helper.h"

void pbhelper_DrawCircleSectorLines(Vector2* center, float radius, int startAngle, int endAngle, int segments, Color color) {
	if( center ) DrawCircleSectorLines(*center, radius, startAngle, endAngle, segments, color);
}
