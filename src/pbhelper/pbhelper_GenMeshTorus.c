#include "raylib_pb_helper.h"

void pbhelper_GenMeshTorus(Mesh* result, float radius, float size, int radSeg, int sides) {
    if( result ) *result = GenMeshTorus(radius, size, radSeg, sides);
}
