#include "raylib_pb_helper.h"

void pbhelper_UpdateSound(Sound* sound, const void *data, int samplesCount) {
    if( sound && data ) UpdateSound(*sound, data, samplesCount);
}
