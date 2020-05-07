#include "raylib_pb_helper.h"

void pbhelper_MeshBoundingBox(BoundingBox* result, Mesh* mesh) {
    if( result && mesh ) *result = MeshBoundingBox(*mesh);
}
