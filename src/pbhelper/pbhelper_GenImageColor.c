#include "raylib_pb_helper.h"

void pbhelper_GenImageColor(Image* image, int width, int height, Color color) {
    if( image ) *image = GenImageColor(width, height, color);
}
