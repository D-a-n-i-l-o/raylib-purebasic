#include "raylib_pb_helper.h"

void pbhelper_GetShaderDefault(Shader* result) {
    if( result ) *result = GetShaderDefault();
}
