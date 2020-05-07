#include "raylib_pb_helper.h"

void pbhelper_SetShapesTexture(Texture2D* texture, Rectangle* source) {
    if( texture && source ) SetShapesTexture(*texture, *source);
}
