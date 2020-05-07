#include "raylib_pb_helper.h"

Color* pbhelper_ImageExtractPalette(Image* in_image, int maxPaletteSize, int *extractCount) {
	if( in_image && extractCount ) return ImageExtractPalette(*in_image, maxPaletteSize, extractCount);
	return 0;
}
