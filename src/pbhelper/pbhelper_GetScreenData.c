#include "raylib_pb_helper.h"

void pbhelper_GetScreenData(Image* result) {
    if( result ) *result = GetScreenData();
}
