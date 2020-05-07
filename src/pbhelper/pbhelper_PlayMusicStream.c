#include "raylib_pb_helper.h"

void pbhelper_PlayMusicStream(Music* music) {
    if( music ) PlayMusicStream(*music);
}
