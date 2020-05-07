#include "raylib_pb_helper.h"

void pbhelper_DrawCubeV(Vector3* position, Vector3* size, Color color) {
    if( position && size ) DrawCubeV(*position, *size, color);
}
