#include "raylib_pb_helper.h"

void pbhelper_SetShaderValueTexture(Shader* shader, int uniformLoc, Texture2D* texture) {
    if( shader && texture ) SetShaderValueTexture(*shader, uniformLoc, *texture);
}
