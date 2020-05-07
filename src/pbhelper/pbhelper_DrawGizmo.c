#include "raylib_pb_helper.h"

void pbhelper_DrawGizmo(Vector3* position) {
    if( position ) DrawGizmo(*position);
}
