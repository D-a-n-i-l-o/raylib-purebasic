#include "raylib_pb_helper.h"

void pbhelper_ImageCopy(Image* out_copy, Image* in_source) {
    if( out_copy && in_source ) *out_copy = ImageCopy(*in_source);
}
