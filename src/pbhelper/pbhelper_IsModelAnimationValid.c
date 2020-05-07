#include "raylib_pb_helper.h"

bool pbhelper_IsModelAnimationValid(Model* model, ModelAnimation* anim) {
    if( model && anim ) return IsModelAnimationValid(*model, *anim);
    return false;
}
