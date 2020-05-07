#include "raylib_pb_helper.h"

void pbhelper_SetVrConfiguration(VrDeviceInfo* info, Shader* distortion) {
    if( info && distortion ) SetVrConfiguration(*info, *distortion);
}
