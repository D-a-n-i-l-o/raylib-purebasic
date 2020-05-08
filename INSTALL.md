# General

The `raylib-purebasic` import uses original libraries from the raylib distribution, and additionally

it requires some *'wrapper functions'*, when a C-function can not be called directly by PureBasic.

That's mostly the case when complete structures are used *'ByVal'* in C. Many raylib functions return complete structures like `Matrix`, or take `Vector3` and `Camera3D` as function parameters.

The *'wrapper functions'* are located in the `src/helper` directory. Each function is in a separate `.c` file, so only used functions are linked into the resulting executable.

In case of linker problems when compiling with PureBasic, it may be required to re-compile the helper library.

The compile-scripts are located in the `src` directory.

For using `raylib-purebasic` with PureBasic, only the **raylib.pbi** include and the binary libraries in the `bin` folder are required.

The `src` folder contains the source for the *'wrapper functions'* and is not required when developing with PureBasic.

# Linux

On Linux you need to install additional development libraries `libglfw3-dev` and `libvulkan-dev`.

Compiled executables use static raylib import libraries.

1. Update apt-get

    `sudo apt-get update`

2. Install libs for PureBasic

    `sudo apt-get install gcc g++ libc6-dev libsdl1.2-dev libgtk-3-dev unixodbc-dev libgnome2-dev libxine2-dev libxxf86vm-dev libwebkitgtk-dev libwebkitgtk-3.0-dev`

3. Install additional library dependencies for raylib:

    `sudo apt-get install libglfw3 libglfw3-dev libvulkan-dev`

**Please Note**: If you want to re-compile the helper libraries:

- On Linux it is highly recommended to compile directly on the platform you want to compile for.

- Compile the 32-bit helper-lib on Linux x86 and the 64-bit helper-lib on Linux x64.



# macOS

On macOS no special installation steps are required.


# Windows

On Windows you should install the correct raylib.dll into your system.

You find both DLLs, `x86` & `x64` version, in the directory `/bin/Windows DLLs/`.

The `install.cmd` script in `/bin/Windows DLLs/` is an example for installing the DLL's into your system. Admin rights are required, please look at the script for detailed instructions. Installation of the DLL's into the system may be different on your computer.

System-wide installation of the DLL's may make developing easier but is not a requirement. You can also put the DLL into the folder of the game or application you develop.

The DLL's are required when you distribute your creation, so don't forget to include them.