#include "raylib_pb_helper.h"

void pbhelper_UnloadMusicStream(Music* music) {
    if( music ) UnloadMusicStream(*music);
}
