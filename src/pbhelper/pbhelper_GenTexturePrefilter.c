#include "raylib_pb_helper.h"

void pbhelper_GenTexturePrefilter(Texture2D* result, Shader* shader, Texture2D* cubemap, int size) {
    if( result && shader && cubemap ) *result = GenTexturePrefilter(*shader, *cubemap, size);
}
