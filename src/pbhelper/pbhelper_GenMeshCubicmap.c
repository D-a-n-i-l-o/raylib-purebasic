#include "raylib_pb_helper.h"

void pbhelper_GenMeshCubicmap(Mesh* result, Image* cubicmap, Vector3* cubeSize) {
    if( result && cubicmap && cubeSize ) *result = GenMeshCubicmap(*cubicmap, *cubeSize);
}
