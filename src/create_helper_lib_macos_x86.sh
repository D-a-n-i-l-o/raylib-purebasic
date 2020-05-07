#!/bin/sh

cd out
rm *.o
rm *.obj
gcc -m32 -c -ffreestanding ../pbhelper/*.c
cd ..
ar rcs ../bin/libraylib_macos_pbhelper_x86.a out/*.o
rm ./out/*.o
rm ./out/*.obj
