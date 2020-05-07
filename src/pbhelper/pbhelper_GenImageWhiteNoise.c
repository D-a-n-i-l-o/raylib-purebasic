#include "raylib_pb_helper.h"

void pbhelper_GenImageWhiteNoise(Image* image, int width, int height, float factor) {
    if( image ) *image = GenImageWhiteNoise(width, height, factor);
}
