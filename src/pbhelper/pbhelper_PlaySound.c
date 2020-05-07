#include "raylib_pb_helper.h"

void pbhelper_PlaySound(Sound* sound) {
    if( sound ) PlaySound(*sound);
}
