#include "raylib_pb_helper.h"

void pbhelper_PlaySoundMulti(Sound* sound) {
    if( sound ) PlaySoundMulti(*sound);
}
