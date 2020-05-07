#include "raylib_pb_helper.h"

void pbhelper_LoadImageEx(Image* image, Color *pixels, int width, int height) {
	if( image && pixels ) *image = LoadImageEx(pixels, width, height);
}
