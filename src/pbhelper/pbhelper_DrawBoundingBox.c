#include "raylib_pb_helper.h"

void pbhelper_DrawBoundingBox(BoundingBox* box, Color color) {
    if( box ) DrawBoundingBox(*box, color);
}
