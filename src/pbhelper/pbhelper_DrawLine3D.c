#include "raylib_pb_helper.h"

void pbhelper_DrawLine3D(Vector3* startPos, Vector3* endPos, Color color) {
    if( startPos && endPos ) DrawLine3D(*startPos, *endPos, color);
}
