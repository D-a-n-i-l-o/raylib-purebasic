#include "raylib_pb_helper.h"

void pbhelper_StopSound(Sound* sound) {
    if( sound ) StopSound(*sound);
}
