#include "raylib_pb_helper.h"

#include <stdio.h>
#include <stdarg.h>

//#include <cstdio>

pbTraceLogCallback callback = 0;

void pbhelper_RaylibTraceLogCallback(int logType, const char *text, va_list args) {
    // without PureBasic callback we don't need to do anything
    if (callback) {
        // message buffer
        int i;
        char message_buffer[10 * 1024];

        // format message into message_buffer
        int chars_written = vsprintf(message_buffer, text, args);

        // if there was an error, we continue anyway (with empty message "")
        if (chars_written < 0) {
            chars_written = 0;
        }

        for (i=0; i<10; i++) {                      // Set 10 chars after the message to 0,
            message_buffer[chars_written+i] = 0;    // so even a 32-bit Unicode PeekString()
        }                                           // or an Utf8 PeekS() has no problem

        // call the PureBasic function with the buffer
        callback(logType, message_buffer);
    }
}

void pbhelper_SetTraceLogCallback(pbTraceLogCallback p) {
    callback = p;
    SetTraceLogCallback( pbhelper_RaylibTraceLogCallback );
}
