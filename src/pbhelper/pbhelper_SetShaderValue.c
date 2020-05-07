#include "raylib_pb_helper.h"

void pbhelper_SetShaderValue(Shader* shader, int uniformLoc, const void *value, int uniformType) {
    if( shader && value ) SetShaderValue(*shader, uniformLoc, value, uniformType);
}
