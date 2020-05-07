#include "raylib_pb_helper.h"

void pbhelper_GenTextureBRDF(Texture2D* result, Shader* shader, int size) {
    if( result && shader ) *result = GenTextureBRDF(*shader, size);
}
