#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleRec(Rectangle* rect, Color color) {
    if( rect ) DrawRectangleRec(*rect, color);
}
