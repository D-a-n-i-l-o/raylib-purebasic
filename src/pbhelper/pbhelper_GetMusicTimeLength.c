#include "raylib_pb_helper.h"

float pbhelper_GetMusicTimeLength(Music* music) {
    if( music ) return GetMusicTimeLength(*music);
    return 0.0f;
}
