#include "raylib_pb_helper.h"

void pbhelper_ImageFromImage(Image* out_image, Image* in_image, Rectangle* rect) {
    if( out_image && in_image && rect ) *out_image = ImageFromImage(*in_image, *rect);
}
