#include "raylib_pb_helper.h"

void pbhelper_SetShaderValueV(Shader* shader, int uniformLoc, const void *value, int uniformType, int count) {
    if( shader && value ) SetShaderValueV(*shader, uniformLoc, value, uniformType, count);
}
