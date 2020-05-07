#include "raylib_pb_helper.h"

void pbhelper_LoadWave(Wave* result, const char *fileName) {
    if( result && fileName ) *result = LoadWave(fileName);
}
