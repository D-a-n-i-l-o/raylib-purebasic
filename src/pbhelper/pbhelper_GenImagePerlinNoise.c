#include "raylib_pb_helper.h"

void pbhelper_GenImagePerlinNoise(Image* image, int width, int height, int offsetX, int offsetY, float scale) {
    if( image ) *image = GenImagePerlinNoise(width, height, offsetX, offsetY, scale);
}
