#include "raylib_pb_helper.h"

float pbhelper_GetMusicTimePlayed(Music* music) {
    if( music ) return GetMusicTimePlayed(*music);
    return 0.0f;
}
