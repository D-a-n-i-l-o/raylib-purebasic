#include "raylib_pb_helper.h"

void pbhelper_ImageTextEx(Image* out_image, Font* font, const char *text, float fontSize, float spacing, Color tint) {
    if( out_image && font && text ) *out_image = ImageTextEx(*font, text, fontSize, spacing, tint);
}
