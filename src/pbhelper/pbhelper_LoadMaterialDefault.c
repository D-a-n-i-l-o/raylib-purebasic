#include "raylib_pb_helper.h"

void pbhelper_LoadMaterialDefault(Material* result) {
    if( result ) *result = LoadMaterialDefault();
}
