#include "raylib_pb_helper.h"

void pbhelper_GenMeshSphere(Mesh* result, float radius, int rings, int slices) {
    if( result ) *result = GenMeshSphere(radius, rings, slices);
}
