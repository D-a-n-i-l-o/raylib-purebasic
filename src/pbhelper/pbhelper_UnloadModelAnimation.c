#include "raylib_pb_helper.h"

void pbhelper_UnloadModelAnimation(ModelAnimation* anim) {
    if( anim ) UnloadModelAnimation(*anim);
}
