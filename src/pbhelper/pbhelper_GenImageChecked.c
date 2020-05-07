#include "raylib_pb_helper.h"

void pbhelper_GenImageChecked(Image* image, int width, int height, int checksX, int checksY, Color col1, Color col2) {
    if( image ) *image = GenImageChecked(width, height, checksX, checksY, col1, col2);
}
