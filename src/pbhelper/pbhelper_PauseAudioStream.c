#include "raylib_pb_helper.h"

void pbhelper_PauseAudioStream(AudioStream* stream) {
    if( stream ) PauseAudioStream(*stream);
}
