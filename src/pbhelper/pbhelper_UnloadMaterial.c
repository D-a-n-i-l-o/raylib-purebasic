#include "raylib_pb_helper.h"

void pbhelper_UnloadMaterial(Material* material) {
    if( material ) UnloadMaterial(*material);
}
