#include "raylib_pb_helper.h"

void pbhelper_DrawCubeTexture(Texture2D* texture, Vector3* position, float width, float height, float length, Color color) {
    if( texture && position ) DrawCubeTexture(*texture, *position, width, height, length, color);
}
