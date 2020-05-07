#include "raylib_pb_helper.h"

float* pbhelper_GetWaveData(Wave* wave) {
    if( wave ) return GetWaveData(*wave);
    return 0;
}
