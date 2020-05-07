#include "raylib_pb_helper.h"

void pbhelper_SetWindowIcon(Image* image) {
	if( image ) SetWindowIcon(*image);
}
