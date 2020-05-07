#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionCircleRec(Vector2* center, float radius, Rectangle* rect) {
	if( center && rect ) return CheckCollisionCircleRec(*center, radius, *rect);
	return false;
}
