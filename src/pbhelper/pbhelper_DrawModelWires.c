#include "raylib_pb_helper.h"

void pbhelper_DrawModelWires(Model* model, Vector3* position, float scale, Color tint) {
    if( model && position ) DrawModelWires(*model, *position, scale, tint);
}
