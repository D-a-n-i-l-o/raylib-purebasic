#include "raylib_pb_helper.h"

void pbhelper_GetMatrixModelview(Matrix* result) {
    if( result ) *result = GetMatrixModelview();
}
