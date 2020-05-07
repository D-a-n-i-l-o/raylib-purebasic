#include "raylib_pb_helper.h"

void pbhelper_PlayAudioStream(AudioStream* stream) {
    if( stream ) PlayAudioStream(*stream);
}
