#include "raylib_pb_helper.h"

int  pbhelper_MeasureText(const char *text, int fontSize) {
    if( text ) return MeasureText(text, fontSize);
    return 0;
}
