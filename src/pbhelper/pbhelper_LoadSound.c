#include "raylib_pb_helper.h"

void pbhelper_LoadSound(Sound* result, const char *fileName) {
    if( result && fileName ) *result = LoadSound(fileName);
}
