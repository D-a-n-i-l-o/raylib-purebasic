#include "raylib_pb_helper.h"

bool pbhelper_IsAudioStreamPlaying(AudioStream* stream) {
    if( stream ) return IsAudioStreamPlaying(*stream);
    return false;
}
