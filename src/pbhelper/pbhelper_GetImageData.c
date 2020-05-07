#include "raylib_pb_helper.h"

Color *pbhelper_GetImageData(Image* image) {
	if( image ) return GetImageData(*image);
	return 0;
}
