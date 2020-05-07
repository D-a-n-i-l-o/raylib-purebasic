#include "raylib_pb_helper.h"

void pbhelper_SetTextureWrap(Texture2D* texture, int wrapMode) {
    if( texture ) SetTextureWrap(*texture, wrapMode);
}
