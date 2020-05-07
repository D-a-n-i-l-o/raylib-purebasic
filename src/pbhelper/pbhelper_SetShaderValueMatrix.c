#include "raylib_pb_helper.h"

void pbhelper_SetShaderValueMatrix(Shader* shader, int uniformLoc, Matrix* mat) {
    if( shader && mat ) SetShaderValueMatrix(*shader, uniformLoc, *mat);
}
