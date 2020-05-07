#include "raylib_pb_helper.h"

void pbhelper_GetMouseRay(Ray* ray, Vector2* mousePosition, Camera* camera) {
    if( ray && mousePosition && camera ) *ray = GetMouseRay(*mousePosition, *camera);
}
