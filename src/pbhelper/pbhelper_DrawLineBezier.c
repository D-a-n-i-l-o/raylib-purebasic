#include "raylib_pb_helper.h"

void pbhelper_DrawLineBezier(Vector2* startPos, Vector2* endPos, float thick, Color color) {
	if( startPos && endPos ) DrawLineBezier(*startPos, *endPos, thick, color);
}
