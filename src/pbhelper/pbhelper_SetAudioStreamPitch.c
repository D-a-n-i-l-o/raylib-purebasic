#include "raylib_pb_helper.h"

void pbhelper_SetAudioStreamPitch(AudioStream* stream, float pitch) {
    if( stream ) SetAudioStreamPitch(*stream, pitch);
}
