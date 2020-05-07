#include "raylib_pb_helper.h"

void pbhelper_StopMusicStream(Music* music) {
    if( music ) StopMusicStream(*music);
}
