#include "raylib_pb_helper.h"

long int pbhelper_ColorFromHSV(Vector3* hsv) {
    if ( !hsv ) return -1;
    return (long int)ColorToInt(ColorFromHSV(*hsv)) & 0xFFFFFFFF;
}
