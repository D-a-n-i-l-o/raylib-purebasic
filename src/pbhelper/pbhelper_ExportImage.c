#include "raylib_pb_helper.h"

void pbhelper_ExportImage(Image* image, const char *fileName) {
	if( image && fileName ) ExportImage(*image, fileName);
}
