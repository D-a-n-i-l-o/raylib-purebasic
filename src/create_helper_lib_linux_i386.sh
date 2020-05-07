#!/bin/sh

cd out
rm *.o
rm *.obj
gcc -m32 -c -ffreestanding ../pbhelper/*.c
cd ..
ar rcs ../bin/libraylib_linux_pbhelper_i386.a out/*.o
rm ./out/*.o
rm ./out/*.obj
