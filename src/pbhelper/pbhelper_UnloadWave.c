#include "raylib_pb_helper.h"

void pbhelper_UnloadWave(Wave* wave) {
    if( wave ) UnloadWave(*wave);
}
