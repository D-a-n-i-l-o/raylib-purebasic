#include "raylib_pb_helper.h"

bool pbhelper_IsAudioStreamProcessed(AudioStream* stream) {
    if( stream ) return IsAudioStreamProcessed(*stream);
    return false;
}
