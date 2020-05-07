#include "raylib_pb_helper.h"

void pbhelper_GenImageGradientRadial(Image* image, int width, int height, float density, Color inner, Color outer) {
    if( image ) *image = GenImageGradientRadial(width, height, density, inner, outer);
}
