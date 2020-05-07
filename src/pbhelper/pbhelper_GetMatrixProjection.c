#include "raylib_pb_helper.h"

void pbhelper_GetMatrixProjection(Matrix* result) {
    if( result ) *result = GetMatrixProjection();
}
