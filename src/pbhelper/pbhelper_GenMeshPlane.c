#include "raylib_pb_helper.h"

void pbhelper_GenMeshPlane(Mesh* result, float width, float length, int resX, int resZ) {
    if( result ) *result = GenMeshPlane(width, length, resX, resZ);
}
