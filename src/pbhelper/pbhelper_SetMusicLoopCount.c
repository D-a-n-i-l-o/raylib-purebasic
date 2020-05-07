#include "raylib_pb_helper.h"

void pbhelper_SetMusicLoopCount(Music* music, int count) {
    if( music ) SetMusicLoopCount(*music, count);
}
