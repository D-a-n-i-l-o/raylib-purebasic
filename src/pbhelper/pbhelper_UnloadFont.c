#include "raylib_pb_helper.h"

void pbhelper_UnloadFont(Font* font) {
    if( font ) UnloadFont(*font);
}
