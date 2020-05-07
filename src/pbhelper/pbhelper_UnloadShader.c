#include "raylib_pb_helper.h"

void pbhelper_UnloadShader(Shader* shader) {
    if( shader ) UnloadShader(*shader);
}
