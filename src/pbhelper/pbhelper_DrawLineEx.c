#include "raylib_pb_helper.h"

void pbhelper_DrawLineEx(Vector2* startPos, Vector2* endPos, float thick, Color color) {
	if( startPos && endPos ) DrawLineEx(*startPos, *endPos, thick, color);
}
