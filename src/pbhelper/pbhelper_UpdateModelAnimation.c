#include "raylib_pb_helper.h"

void pbhelper_UpdateModelAnimation(Model* model, ModelAnimation* anim, int frame) {
    if( model && anim ) UpdateModelAnimation(*model, *anim, frame);
}
