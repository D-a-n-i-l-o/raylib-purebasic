#include "raylib_pb_helper.h"

void pbhelper_UpdateAudioStream(AudioStream* stream, const void *data, int samplesCount) {
    if( stream && data ) UpdateAudioStream(*stream, data, samplesCount);
}
