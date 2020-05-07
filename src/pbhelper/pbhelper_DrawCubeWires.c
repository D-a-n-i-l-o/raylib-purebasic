#include "raylib_pb_helper.h"

void pbhelper_DrawCubeWires(Vector3* position, float width, float height, float length, Color color) {
	if( position ) DrawCubeWires(*position, width, height, length, color);
}
