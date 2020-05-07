#include "raylib_pb_helper.h"

void pbhelper_SetAudioStreamVolume(AudioStream* stream, float volume) {
    if( stream ) SetAudioStreamVolume(*stream, volume);
}
