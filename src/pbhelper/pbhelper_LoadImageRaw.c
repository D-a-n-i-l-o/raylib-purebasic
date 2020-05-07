#include "raylib_pb_helper.h"

void pbhelper_LoadImageRaw(Image* image, const char *fileName, int width, int height, int format, int headerSize) {
	if( image && fileName ) *image = LoadImageRaw(fileName, width, height, format, headerSize);
}
