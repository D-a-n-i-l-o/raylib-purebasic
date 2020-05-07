#include "raylib_pb_helper.h"

void pbhelper_GenTextureCubemap(Texture2D* result, Shader* shader, Texture2D* map, int size) {
    if( result && shader && map ) *result = GenTextureCubemap(*shader, *map, size);
}
