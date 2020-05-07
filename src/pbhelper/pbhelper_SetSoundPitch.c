#include "raylib_pb_helper.h"

void pbhelper_SetSoundPitch(Sound* sound, float pitch) {
    if( sound ) SetSoundPitch(*sound, pitch);
}
