#include "raylib_pb_helper.h"

void pbhelper_ExportWaveAsCode(Wave* wave, const char *fileName) {
    if( wave && fileName ) ExportWaveAsCode(*wave, fileName);
}
