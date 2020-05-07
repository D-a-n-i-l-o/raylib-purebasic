#include "raylib_pb_helper.h"

void pbhelper_GenMeshCylinder(Mesh* result, float radius, float height, int slices) {
    if( result ) *result = GenMeshCylinder(radius, height, slices);
}
