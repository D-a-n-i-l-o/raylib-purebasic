#include "raylib_pb_helper.h"

void pbhelper_DrawSphere(Vector3* centerPos, float radius, Color color) {
    if( centerPos ) DrawSphere(*centerPos, radius, color);
}
