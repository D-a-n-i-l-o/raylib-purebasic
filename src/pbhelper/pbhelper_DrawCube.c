#include "raylib_pb_helper.h"

void pbhelper_DrawCube(Vector3* position, float width, float height, float length, Color color) {
	if( position ) DrawCube(*position, width, height, length, color);
}
