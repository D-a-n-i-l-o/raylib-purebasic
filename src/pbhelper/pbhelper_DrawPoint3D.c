#include "raylib_pb_helper.h"

void pbhelper_DrawPoint3D(Vector3* position, Color color) {
    if( position ) DrawPoint3D(*position, color);
}
