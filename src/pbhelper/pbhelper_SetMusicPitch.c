#include "raylib_pb_helper.h"

void pbhelper_SetMusicPitch(Music* music, float pitch) {
    if( music ) SetMusicPitch(*music, pitch);
}
