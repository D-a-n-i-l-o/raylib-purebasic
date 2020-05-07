#include "raylib_pb_helper.h"

void pbhelper_PauseSound(Sound* sound) {
    if( sound ) PauseSound(*sound);
}
