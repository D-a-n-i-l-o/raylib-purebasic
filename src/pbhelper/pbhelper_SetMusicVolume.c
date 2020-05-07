#include "raylib_pb_helper.h"

void pbhelper_SetMusicVolume(Music* music, float volume) {
    if( music ) SetMusicVolume(*music, volume);
}
