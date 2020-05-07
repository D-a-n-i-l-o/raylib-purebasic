#include "raylib_pb_helper.h"

void pbhelper_DrawRay(Ray* ray, Color color) {
    if( ray ) DrawRay(*ray, color);
}
