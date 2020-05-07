#include "raylib_pb_helper.h"

void pbhelper_GenMeshCube(Mesh* result, float width, float height, float length) {
    if( result ) *result = GenMeshCube(width, height, length);
}
