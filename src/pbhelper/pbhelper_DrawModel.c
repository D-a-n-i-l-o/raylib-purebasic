#include "raylib_pb_helper.h"

void pbhelper_DrawModel(Model* model, Vector3* position, float scale, Color tint) {
    if( model && position ) DrawModel(*model, *position, scale, tint);
}
