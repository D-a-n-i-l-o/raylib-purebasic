#include "raylib_pb_helper.h"

void pbhelper_GetImageAlphaBorder(Rectangle* out_rect, Image* in_image, float threshold) {
	if( out_rect && in_image ) *out_rect = GetImageAlphaBorder(*in_image, threshold);
}
