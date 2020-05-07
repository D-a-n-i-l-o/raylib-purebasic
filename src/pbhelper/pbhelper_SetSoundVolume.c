#include "raylib_pb_helper.h"

void pbhelper_SetSoundVolume(Sound* sound, float volume) {
    if( sound ) SetSoundVolume(*sound, volume);
}
