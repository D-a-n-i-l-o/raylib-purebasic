#include "raylib_pb_helper.h"

void pbhelper_InitAudioStream(AudioStream* result, unsigned int sampleRate, unsigned int sampleSize, unsigned int channels) {
    if( result ) *result = InitAudioStream(sampleRate, sampleSize, channels);
}
