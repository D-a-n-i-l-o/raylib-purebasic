#include "raylib_pb_helper.h"

void pbhelper_DrawCircleV(Vector2* center, float radius, Color color) {
	if( center ) DrawCircleV(*center, radius, color);
}
