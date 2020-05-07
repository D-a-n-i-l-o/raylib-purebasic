#include "raylib_pb_helper.h"

void pbhelper_UnloadSound(Sound* sound) {
    if( sound ) UnloadSound(*sound);
}
