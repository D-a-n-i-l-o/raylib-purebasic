#include "raylib_pb_helper.h"

void pbhelper_BeginMode3D(Camera3D* camera) {
	if( camera ) BeginMode3D(*camera);
}
