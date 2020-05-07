#include "raylib_pb_helper.h"

void pbhelper_DrawRectangleLinesEx(Rectangle* rect, int lineThick, Color color) {
    if( rect ) DrawRectangleLinesEx(*rect, lineThick, color);
}
