#include "raylib_pb_helper.h"

void pbhelper_GenMeshHemiSphere(Mesh* result, float radius, int rings, int slices) {
    if( result ) *result = GenMeshHemiSphere(radius, rings, slices);
}
