#include "raylib_pb_helper.h"

void pbhelper_CloseAudioStream(AudioStream* stream) {
    if( stream ) CloseAudioStream(*stream);
}
