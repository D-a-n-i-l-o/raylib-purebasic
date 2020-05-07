#include "raylib_pb_helper.h"

void pbhelper_ResumeAudioStream(AudioStream* stream) {
    if( stream ) ResumeAudioStream(*stream);
}
