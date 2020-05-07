#include "raylib_pb_helper.h"

void pbhelper_ImageDraw(Image *dst, Image* src, Rectangle* srcRec, Rectangle* dstRec, Color tint) {
    if( dst && src && srcRec && dstRec ) ImageDraw(dst, *src, *srcRec, *dstRec, tint);
}
