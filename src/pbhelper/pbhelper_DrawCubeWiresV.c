#include "raylib_pb_helper.h"

void pbhelper_DrawCubeWiresV(Vector3* position, Vector3* size, Color color) {
    if( position && size ) DrawCubeWiresV(*position, *size, color);
}
