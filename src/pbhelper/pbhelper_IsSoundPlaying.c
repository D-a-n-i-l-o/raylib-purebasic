#include "raylib_pb_helper.h"

bool pbhelper_IsSoundPlaying(Sound* sound) {
    if( sound ) return IsSoundPlaying(*sound);
    return false;
}
