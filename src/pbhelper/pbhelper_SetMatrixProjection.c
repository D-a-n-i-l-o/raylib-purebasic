#include "raylib_pb_helper.h"

void pbhelper_SetMatrixProjection(Matrix* proj) {
    if( proj ) SetMatrixProjection(*proj);
}
