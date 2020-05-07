#include "raylib_pb_helper.h"

void pbhelper_SetMatrixModelview(Matrix* view) {
    if( view ) SetMatrixModelview(*view);
}
