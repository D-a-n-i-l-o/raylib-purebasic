#include "raylib_pb_helper.h"

void pbhelper_GenMeshKnot(Mesh* result, float radius, float size, int radSeg, int sides) {
    if( result ) *result = GenMeshKnot(radius, size, radSeg, sides);
}
