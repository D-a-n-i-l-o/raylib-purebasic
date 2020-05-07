#include "raylib_pb_helper.h"

void pbhelper_UnloadTexture(Texture2D* texture) {
    if( texture ) UnloadTexture(*texture);
}
