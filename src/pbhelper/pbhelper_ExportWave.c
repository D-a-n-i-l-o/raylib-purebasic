#include "raylib_pb_helper.h"

void pbhelper_ExportWave(Wave* wave, const char *fileName) {
    if( wave && fileName ) ExportWave(*wave, fileName);
}
