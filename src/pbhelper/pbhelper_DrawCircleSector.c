#include "raylib_pb_helper.h"

void pbhelper_DrawCircleSector(Vector2* center, float radius, int startAngle, int endAngle, int segments, Color color) {
	if( center ) DrawCircleSector(*center, radius, startAngle, endAngle, segments, color);
}
