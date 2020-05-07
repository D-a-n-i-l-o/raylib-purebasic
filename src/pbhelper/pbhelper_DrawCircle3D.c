#include "raylib_pb_helper.h"

void pbhelper_DrawCircle3D(Vector3* center, float radius, Vector3* rotationAxis, float rotationAngle, Color color) {
    if( center && rotationAxis ) DrawCircle3D(*center, radius, *rotationAxis, rotationAngle, color);
}
