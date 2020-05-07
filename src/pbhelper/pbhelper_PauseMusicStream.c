#include "raylib_pb_helper.h"

void pbhelper_PauseMusicStream(Music* music) {
    if( music ) PauseMusicStream(*music);
}
