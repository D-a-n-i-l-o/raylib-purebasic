#include "raylib_pb_helper.h"

void pbhelper_BeginMode2D(Camera2D* camera) {
	if( camera ) BeginMode2D(*camera);
}
