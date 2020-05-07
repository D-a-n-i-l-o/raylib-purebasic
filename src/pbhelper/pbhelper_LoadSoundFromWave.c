#include "raylib_pb_helper.h"

void pbhelper_LoadSoundFromWave(Sound* result, Wave* wave) {
    if( result && wave ) *result = LoadSoundFromWave(*wave);
}
