#include "raylib_pb_helper.h"

void pbhelper_StopAudioStream(AudioStream* stream) {
    if( stream ) StopAudioStream(*stream);
}
