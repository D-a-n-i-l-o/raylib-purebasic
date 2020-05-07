#include "raylib_pb_helper.h"

void pbhelper_ImageAlphaMask(Image* inout_image, Image* alphaMask) {
	if( inout_image && alphaMask ) ImageAlphaMask(inout_image, *alphaMask);
}
