#include "raylib_pb_helper.h"

void pbhelper_UnloadImage(Image* image) {
	if( image ) UnloadImage(*image);
}
