#include "raylib_pb_helper.h"

long int pbhelper_ColorFromNormalized(Vector4* normalized) {
    if ( !normalized ) return -1;
    return (long int)ColorToInt(ColorFromNormalized(*normalized)) & 0xFFFFFFFF;
}
