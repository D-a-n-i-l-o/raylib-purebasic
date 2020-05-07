#include "raylib_pb_helper.h"

void pbhelper_LoadMusicStream(Music* result, const char *fileName) {
    if( result && fileName ) *result = LoadMusicStream(fileName);
}
