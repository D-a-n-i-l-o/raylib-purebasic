#include "raylib_pb_helper.h"

void pbhelper_GetCameraMatrix(Matrix* result, Camera* camera) {
    if( result && camera ) *result = GetCameraMatrix(*camera);
}
