::
::  We use the VC++ compiler from Windows 7 SDK
::
call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\bin\vcvars32.bat"

cd out
del *.obj

cl /O2 /EHs-c- /GS- /GR- /Gd /TC /c ..\pbhelper\*.c /DSTATIC /DPLATFORM_DESKTOP /DSTBI_NO_SIMD /DGRAPHICS_API_OPENGL_3

cd ..
cd ..
lib /OUT:bin\raylib_win32_pbhelper.lib src\out\*.obj

cd src\out
del *.obj
cd ..

pause
