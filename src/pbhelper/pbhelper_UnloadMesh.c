#include "raylib_pb_helper.h"

void pbhelper_UnloadMesh(Mesh* mesh) {
    if( mesh ) UnloadMesh(*mesh);
}
