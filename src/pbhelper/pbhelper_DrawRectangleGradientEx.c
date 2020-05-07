#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleGradientEx(Rectangle* rect, Color col1, Color col2, Color col3, Color col4) {
    if( rect ) DrawRectangleGradientEx(*rect, col1, col2, col3, col4);
}
