#include "raylib_pb_helper.h"

void pbhelper_BeginShaderMode(Shader* shader) {
    if( shader ) BeginShaderMode(*shader);
}
