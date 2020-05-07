#include "raylib_pb_helper.h"

void pbhelper_DrawTexture(Texture2D* texture, int posX, int posY, Color tint) {
    if( texture ) DrawTexture(*texture, posX, posY, tint);
}
