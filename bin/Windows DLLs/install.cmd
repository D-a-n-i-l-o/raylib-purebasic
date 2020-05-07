::
::  - Open a console as Admin (rigth-click 'cmd.exe' > 'Run as Administrator')
::
::  - Change to the directory where this file is:
::
::          cd "c:\raylib\bin\Windows DLLs"
::
::  - Run this file on the console
::
::          install.cmd
::
@copy x86\raylib.dll %SystemRoot%\SysWOW64
@copy x64\raylib.dll %SystemRoot%\System32
@pause
