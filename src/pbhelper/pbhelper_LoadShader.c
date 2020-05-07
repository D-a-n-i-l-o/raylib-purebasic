#include "raylib_pb_helper.h"

void pbhelper_LoadShader(Shader* result, const char *vsFileName, const char *fsFileName) {
    if( result && vsFileName && fsFileName ) *result = LoadShader(vsFileName, fsFileName);
}
