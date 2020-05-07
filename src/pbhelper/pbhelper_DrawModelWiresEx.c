#include "raylib_pb_helper.h"

void pbhelper_DrawModelWiresEx(Model* model, Vector3* position, Vector3* rotationAxis, float rotationAngle, Vector3* scale, Color tint) {
    if( model && position && rotationAxis && scale ) DrawModelWiresEx(*model, *position, *rotationAxis, rotationAngle, *scale, tint);
}
