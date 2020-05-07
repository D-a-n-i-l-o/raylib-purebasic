#include "raylib_pb_helper.h"

void pbhelper_LoadImagePro(Image* image, void *data, int width, int height, int format) {
	if( image && data ) *image = LoadImagePro(data, width, height, format);
}
