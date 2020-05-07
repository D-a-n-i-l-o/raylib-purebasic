#include "raylib_pb_helper.h"

void pbhelper_WaveCopy(Wave* result, Wave* wave) {
    if( result && wave ) *result = WaveCopy(*wave);
}
