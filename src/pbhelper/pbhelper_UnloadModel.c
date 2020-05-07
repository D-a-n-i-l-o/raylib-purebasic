#include "raylib_pb_helper.h"

void pbhelper_UnloadModel(Model* model) {
    if( model ) UnloadModel(*model);
}
