#include "raylib_pb_helper.h"

void pbhelper_ColorNormalize(Vector4* result, int color) {
    if ( result ) *result = ColorNormalize(GetColor(color));
}
