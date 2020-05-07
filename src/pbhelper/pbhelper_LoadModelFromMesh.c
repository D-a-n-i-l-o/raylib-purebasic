#include "raylib_pb_helper.h"

void pbhelper_LoadModelFromMesh(Model* result, Mesh* mesh) {
    if( result && mesh ) *result = LoadModelFromMesh(*mesh);
}
