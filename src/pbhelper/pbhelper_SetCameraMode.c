#include "raylib_pb_helper.h"

void pbhelper_SetCameraMode(Camera* camera, int mode) {
    if( camera ) SetCameraMode(*camera, mode);
}
