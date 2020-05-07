#include "raylib_pb_helper.h"

void pbhelper_LoadImage(Image* image, const char *fileName) {
	if( image && fileName ) *image = LoadImage(fileName);
}
