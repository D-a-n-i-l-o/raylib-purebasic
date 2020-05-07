#include "raylib_pb_helper.h"

void pbhelper_ResumeMusicStream(Music* music) {
    if( music ) ResumeMusicStream(*music);
}
