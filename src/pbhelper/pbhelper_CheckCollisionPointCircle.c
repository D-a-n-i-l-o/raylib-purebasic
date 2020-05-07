#include "raylib_pb_helper.h"

bool pbhelper_CheckCollisionPointCircle(Vector2* point, Vector2* center, float radius) {
	if( point && center ) return CheckCollisionPointCircle(*point, *center, radius);
	return false;
}
