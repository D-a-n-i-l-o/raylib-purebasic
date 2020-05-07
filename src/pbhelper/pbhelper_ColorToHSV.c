#include "raylib_pb_helper.h"

void pbhelper_ColorToHSV(Vector3* result, int color) {
    if ( result ) *result = ColorToHSV(GetColor(color));
}
