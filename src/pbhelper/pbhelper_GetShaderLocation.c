#include "raylib_pb_helper.h"

int  pbhelper_GetShaderLocation(Shader* shader, const char *uniformName){
    if( shader && uniformName ) return GetShaderLocation(*shader, uniformName);
    return 0;
}
