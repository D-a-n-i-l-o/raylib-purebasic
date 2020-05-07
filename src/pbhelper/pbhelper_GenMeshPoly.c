#include "raylib_pb_helper.h"

void pbhelper_GenMeshPoly(Mesh* result, int sides, float radius) {
    if( result ) *result = GenMeshPoly(sides, radius);
}
