#include "raylib_pb_helper.h"

void pbhelper_ExportImageAsCode(Image* image, const char *fileName) {
	if( image && fileName ) ExportImageAsCode(*image, fileName);
}
