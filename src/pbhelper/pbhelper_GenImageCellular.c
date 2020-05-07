#include "raylib_pb_helper.h"

void pbhelper_GenImageCellular(Image* image, int width, int height, int tileSize) {
    if( image ) *image = GenImageCellular(width, height, tileSize);
}
