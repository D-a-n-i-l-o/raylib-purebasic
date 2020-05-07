#include "raylib_pb_helper.h"

void pbhelper_GenMeshHeightmap(Mesh* result, Image* heightmap, Vector3* size) {
    if( result && heightmap && size ) *result = GenMeshHeightmap(*heightmap, *size);
}
