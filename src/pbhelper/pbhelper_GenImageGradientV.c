#include "raylib_pb_helper.h"

void pbhelper_GenImageGradientV(Image* image, int width, int height, Color top, Color bottom) {
    if( image ) *image = GenImageGradientV(width, height, top, bottom);
}
