#include "raylib_pb_helper.h"

void pbhelper_GetCameraMatrix2D(Matrix* result, Camera2D* camera) {
    if( result && camera ) *result = GetCameraMatrix2D(*camera);
}
