#include "raylib_pb_helper.h"

bool pbhelper_IsMusicPlaying(Music* music) {
    if( music ) return IsMusicPlaying(*music);
    return false;
}
