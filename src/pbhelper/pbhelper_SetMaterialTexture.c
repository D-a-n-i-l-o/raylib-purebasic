#include "raylib_pb_helper.h"

void pbhelper_SetMaterialTexture(Material* material, int mapType, Texture2D* texture) {
    if( material && texture ) SetMaterialTexture(material, mapType, *texture);
}
