#include "raylib_pb_helper.h"

void pbhelper_SetTextureFilter(Texture2D* texture, int filterMode) {
    if( texture ) SetTextureFilter(*texture, filterMode);
}
