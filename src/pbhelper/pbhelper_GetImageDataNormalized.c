#include "raylib_pb_helper.h"

Vector4 *pbhelper_GetImageDataNormalized(Image* image) {
	if( image ) return GetImageDataNormalized(*image);
	return 0;
}
