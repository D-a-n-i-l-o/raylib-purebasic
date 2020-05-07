#!/bin/sh

cd out
rm *.o
rm *.obj
gcc -m64 -c -ffreestanding ../pbhelper/*.c
cd ..
ar rcs ../bin/libraylib_linux_pbhelper_amd64.a out/*.o
rm ./out/*.o
rm ./out/*.obj
