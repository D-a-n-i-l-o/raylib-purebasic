#include "raylib_pb_helper.h"

void pbhelper_GenImageGradientH(Image* image, int width, int height, Color left, Color right) {
    if( image ) *image = GenImageGradientH(width, height, left, right);
}
