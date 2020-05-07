#include "raylib_pb_helper.h"

void pbhelper_LoadShaderCode(Shader* result, const char *vsCode, const char *fsCode) {
    if( result && vsCode && fsCode ) *result = LoadShaderCode(vsCode, fsCode);
}
