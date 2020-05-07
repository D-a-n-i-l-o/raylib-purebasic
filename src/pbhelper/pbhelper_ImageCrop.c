#include "raylib_pb_helper.h"

void pbhelper_ImageCrop(Image *inout_image, Rectangle* crop) {
	if( inout_image && crop ) ImageCrop(inout_image, *crop);
}
