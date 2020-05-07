#include "raylib_pb_helper.h"

void pbhelper_ExportMesh(Mesh* mesh, const char *fileName) {
    if( mesh && fileName ) ExportMesh(*mesh, fileName);
}
