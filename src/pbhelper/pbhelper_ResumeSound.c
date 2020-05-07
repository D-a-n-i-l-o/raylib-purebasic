#include "raylib_pb_helper.h"

void pbhelper_ResumeSound(Sound* sound) {
    if( sound ) ResumeSound(*sound);
}
