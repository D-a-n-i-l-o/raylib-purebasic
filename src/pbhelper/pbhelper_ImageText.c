#include "raylib_pb_helper.h"

void pbhelper_ImageText(Image* out_image, const char *text, int fontSize, Color color) {
    if( out_image && text ) *out_image = ImageText(text, fontSize, color);
}
