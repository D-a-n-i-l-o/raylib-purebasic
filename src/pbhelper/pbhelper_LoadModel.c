#include "raylib_pb_helper.h"

void pbhelper_LoadModel(Model* result, const char *fileName) {
    if( result && fileName ) *result = LoadModel(fileName);
}
