;**********************************************************************************************
;*
;*   raylib - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
;*
;*   FEATURES:
;*       - NO external dependencies, all required libraries included with raylib
;*       - Multiplatform: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly, MacOS, UWP, Android, Raspberry Pi, HTML5.
;*       - Written in plain C code (C99) in PascalCase/camelCase notation
;*       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3 or ES2 - choose at compile)
;*       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
;*       - Multiple Fonts formats supported (TTF, XNA fonts, AngelCode fonts)
;*       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
;*       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
;*       - Flexible Materials system, supporting classic maps and PBR maps
;*       - Skeletal Animation support (CPU bones-based animation)
;*       - Shaders support, including Model shaders and Postprocessing shaders
;*       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
;*       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
;*       - VR stereo rendering with configurable HMD device parameters
;*       - Bindings to multiple programming languages available!
;*
;*   NOTES:
;*       One custom font is loaded by default when InitWindow() [core]
;*       If using OpenGL 3.3 or ES2, one default shader is loaded automatically (internally defined) [rlgl]
;*       If using OpenGL 3.3 or ES2, several vertex buffers (VAO/VBO) are created to manage lines-triangles-quads
;*
;*   DEPENDENCIES (included):
;*       [core] rglfw (github.com/glfw/glfw) for window/context management and input (only PLATFORM_DESKTOP)
;*       [rlgl] glad (github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading (only PLATFORM_DESKTOP)
;*       [raudio] miniaudio (github.com/dr-soft/miniaudio) for audio device/context management
;*
;*   OPTIONAL DEPENDENCIES (included):
;*       [core] rgif (Charlie Tangora, Ramon Santamaria) for GIF recording
;*       [textures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
;*       [textures] stb_image_write (Sean Barret) for image writting (BMP, TGA, PNG, JPG)
;*       [textures] stb_image_resize (Sean Barret) for image resizing algorithms
;*       [textures] stb_perlin (Sean Barret) for Perlin noise image generation
;*       [text] stb_truetype (Sean Barret) for ttf fonts loading
;*       [text] stb_rect_pack (Sean Barret) for rectangles packing
;*       [models] par_shapes (Philip Rideout) for parametric 3d shapes generation
;*       [models] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
;*       [models] cgltf (Johannes Kuhlmann) for models loading (glTF)
;*       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
;*       [raudio] dr_flac (David Reid) for FLAC audio file loading
;*       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
;*       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
;*       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
;*
;*
;*   LICENSE: zlib/libpng
;*
;*   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;*   BSD-like license that allows static linking with closed source software:
;*
;*   Copyright (c) 2013-2020 Ramon Santamaria (@raysan5)
;*
;*   This software is provided "as-is", without any express or implied warranty. In no event
;*   will the authors be held liable for any damages arising from the use of this software.
;*
;*   Permission is granted to anyone to use this software for any purpose, including commercial
;*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
;*
;*     1. The origin of this software must not be misrepresented; you must not claim that you
;*     wrote the original software. If you use this software in a product, an acknowledgment
;*     in the product documentation would be appreciated but is not required.
;*
;*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
;*     as being the original software.
;*
;*     3. This notice may not be removed or altered from any source distribution.
;*
;**********************************************************************************************
;*
;*   'raylib-purebasic': Copyright (c) 2020 Danilo Krahn
;*
;**********************************************************************************************
EnableExplicit

;- ---------- DeclareModule Start
;{ ---------- DeclareModule Start
DeclareModule ray

   ;#RL_PI = 3.14159265358979323846 ; too many digits
    #RL_PI = 3.1415926535897932385  ; remove last digit and round up

    #MAX_TOUCH_POINTS = 10          ;// Maximum number of touch points supported

    #DEG2RAD = #RL_PI/180.0
    #RAD2DEG = 180.0/#RL_PI

    ;// Temporal hack to avoid breaking old codebases using
    ;// deprecated raylib implementation of these functions
    ;
    ; Macro FormatText : TextFormat   : EndMacro ;
    ; Macro SubText    : TextSubtext  : EndMacro ; This is here for finding the names.
    ; Macro ShowWindow : UnhideWindow : EndMacro ; Just use the new functions in PureBasic.
    ; Macro LoadText   : LoadFileText : EndMacro ;                       - Danilo

    Macro rl_RGBA(r,g,b,a)
        ( a<<24 | b<<16 | g<<8 | r )
    EndMacro

    ;// Some Basic Colors
    ;// NOTE: Custom raylib color palette for amazing visuals on WHITE background
    #COLOR_LIGHTGRAY  = rl_RGBA( 200, 200, 200, 255 )   ;// Light Gray
    #COLOR_Gray       = rl_RGBA( 130, 130, 130, 255 )   ;// Gray
    #COLOR_DARKGRAY   = rl_RGBA( 80, 80, 80, 255 )      ;// Dark Gray
    #COLOR_Yellow     = rl_RGBA( 253, 249, 0, 255 )     ;// Yellow
    #COLOR_GOLD       = rl_RGBA( 255, 203, 0, 255 )     ;// Gold
    #COLOR_ORANGE     = rl_RGBA( 255, 161, 0, 255 )     ;// Orange
    #COLOR_PINK       = rl_RGBA( 255, 109, 194, 255 )   ;// Pink
    #COLOR_Red        = rl_RGBA( 230, 41, 55, 255 )     ;// Red
    #COLOR_MAROON     = rl_RGBA( 190, 33, 55, 255 )     ;// Maroon
    #COLOR_Green      = rl_RGBA( 0, 228, 48, 255 )      ;// Green
    #COLOR_LIME       = rl_RGBA( 0, 158, 47, 255 )      ;// Lime
    #COLOR_DARKGREEN  = rl_RGBA( 0, 117, 44, 255 )      ;// Dark Green
    #COLOR_SKYBLUE    = rl_RGBA( 102, 191, 255, 255 )   ;// Sky Blue
    #COLOR_Blue       = rl_RGBA( 0, 121, 241, 255 )     ;// Blue
    #COLOR_DARKBLUE   = rl_RGBA( 0, 82, 172, 255 )      ;// Dark Blue
    #COLOR_PURPLE     = rl_RGBA( 200, 122, 255, 255 )   ;// Purple
    #COLOR_VIOLET     = rl_RGBA( 135, 60, 190, 255 )    ;// Violet
    #COLOR_DARKPURPLE = rl_RGBA( 112, 31, 126, 255 )    ;// Dark Purple
    #COLOR_BEIGE      = rl_RGBA( 211, 176, 131, 255 )   ;// Beige
    #COLOR_BROWN      = rl_RGBA( 127, 106, 79, 255 )    ;// Brown
    #COLOR_DARKBROWN  = rl_RGBA( 76, 63, 47, 255 )      ;// Dark Brown
    #COLOR_White      = rl_RGBA( 255, 255, 255, 255 )   ;// White
    #COLOR_Black      = rl_RGBA( 0, 0, 0, 255 )         ;// Black
    #COLOR_BLANK      = rl_RGBA( 0, 0, 0, 0 )           ;// Blank (Transparent)
    #COLOR_Magenta    = rl_RGBA( 255, 0, 255, 255 )     ;// Magenta
    #COLOR_RAYWHITE   = rl_RGBA( 245, 245, 245, 255 )   ;// My own White (raylib logo)

    ;- ---------- Enumerations Start
    ;{ ---------- Enumerations Start

    ;//----------------------------------------------------------------------------------
    ;// Enumerators Definition
    ;//----------------------------------------------------------------------------------

    Enumeration bool
        #RL_False
        #RL_True
    EndEnumeration

    ;// System config flags
    ;// NOTE: Used for bit masks
    Enumeration ConfigFlag
        #FLAG_RESERVED           = 1    ;// Reserved
        #FLAG_FULLSCREEN_MODE    = 2    ;// Set to run program in fullscreen
        #FLAG_WINDOW_RESIZABLE   = 4    ;// Set to allow resizable window
        #FLAG_WINDOW_UNDECORATED = 8    ;// Set to disable window decoration (frame and buttons)
        #FLAG_WINDOW_TRANSPARENT = 16   ;// Set to allow transparent window
        #FLAG_WINDOW_HIDDEN      = 128  ;// Set to create the window initially hidden
        #FLAG_WINDOW_ALWAYS_RUN  = 256  ;// Set to allow windows running while minimized
        #FLAG_MSAA_4X_HINT       = 32   ;// Set to try enabling MSAA 4X
        #FLAG_VSYNC_HINT         = 64   ;// Set to try enabling V-Sync on GPU
    EndEnumeration

    ;// Trace log type
    Enumeration TraceLogType
        #LOG_ALL = 0                    ;// Display all logs
        #LOG_TRACE
        #LOG_DEBUG
        #LOG_INFO
        #LOG_WARNING
        #LOG_ERROR
        #LOG_FATAL
        #LOG_NONE                       ;// Disable logging
    EndEnumeration

    ;// Keyboard keys
    Enumeration KeyboardKey
        ;// Alphanumeric keys
        #KEY_APOSTROPHE      = 39
        #KEY_COMMA           = 44
        #KEY_MINUS           = 45
        #KEY_PERIOD          = 46
        #KEY_SLASH           = 47
        #KEY_ZERO            = 48
        #KEY_ONE             = 49
        #KEY_TWO             = 50
        #KEY_THREE           = 51
        #KEY_FOUR            = 52
        #KEY_FIVE            = 53
        #KEY_SIX             = 54
        #KEY_SEVEN           = 55
        #KEY_EIGHT           = 56
        #KEY_NINE            = 57
        #KEY_SEMICOLON       = 59
        #KEY_EQUAL           = 61
        #KEY_A               = 65
        #KEY_B               = 66
        #KEY_C               = 67
        #KEY_D               = 68
        #KEY_E               = 69
        #KEY_F               = 70
        #KEY_G               = 71
        #KEY_H               = 72
        #KEY_I               = 73
        #KEY_J               = 74
        #KEY_K               = 75
        #KEY_L               = 76
        #KEY_M               = 77
        #KEY_N               = 78
        #KEY_O               = 79
        #KEY_P               = 80
        #KEY_Q               = 81
        #KEY_R               = 82
        #KEY_S               = 83
        #KEY_T               = 84
        #KEY_U               = 85
        #KEY_V               = 86
        #KEY_W               = 87
        #KEY_X               = 88
        #KEY_Y               = 89
        #KEY_Z               = 90
    
        ;// Function keys
        #KEY_SPACE           = 32
        #KEY_ESCAPE          = 256
        #KEY_ENTER           = 257
        #KEY_TAB             = 258
        #KEY_BACKSPACE       = 259
        #KEY_INSERT          = 260
        #KEY_DELETE          = 261
        #KEY_RIGHT           = 262
        #KEY_LEFT            = 263
        #KEY_DOWN            = 264
        #KEY_UP              = 265
        #KEY_PAGE_UP         = 266
        #KEY_PAGE_DOWN       = 267
        #KEY_HOME            = 268
        #KEY_END             = 269
        #KEY_CAPS_LOCK       = 280
        #KEY_SCROLL_LOCK     = 281
        #KEY_NUM_LOCK        = 282
        #KEY_PRINT_SCREEN    = 283
        #KEY_PAUSE           = 284
        #KEY_F1              = 290
        #KEY_F2              = 291
        #KEY_F3              = 292
        #KEY_F4              = 293
        #KEY_F5              = 294
        #KEY_F6              = 295
        #KEY_F7              = 296
        #KEY_F8              = 297
        #KEY_F9              = 298
        #KEY_F10             = 299
        #KEY_F11             = 300
        #KEY_F12             = 301
        #KEY_LEFT_SHIFT      = 340
        #KEY_LEFT_CONTROL    = 341
        #KEY_LEFT_ALT        = 342
        #KEY_LEFT_SUPER      = 343
        #KEY_RIGHT_SHIFT     = 344
        #KEY_RIGHT_CONTROL   = 345
        #KEY_RIGHT_ALT       = 346
        #KEY_RIGHT_SUPER     = 347
        #KEY_KB_MENU         = 348
        #KEY_LEFT_BRACKET    = 91
        #KEY_BACKSLASH       = 92
        #KEY_RIGHT_BRACKET   = 93
        #KEY_GRAVE           = 96
    
        ;// Keypad keys
        #KEY_KP_0            = 320
        #KEY_KP_1            = 321
        #KEY_KP_2            = 322
        #KEY_KP_3            = 323
        #KEY_KP_4            = 324
        #KEY_KP_5            = 325
        #KEY_KP_6            = 326
        #KEY_KP_7            = 327
        #KEY_KP_8            = 328
        #KEY_KP_9            = 329
        #KEY_KP_DECIMAL      = 330
        #KEY_KP_DIVIDE       = 331
        #KEY_KP_MULTIPLY     = 332
        #KEY_KP_SUBTRACT     = 333
        #KEY_KP_ADD          = 334
        #KEY_KP_ENTER        = 335
        #KEY_KP_EQUAL        = 336
    EndEnumeration

    ;// Android buttons
    Enumeration AndroidButton
        #KEY_BACK            = 4
        #KEY_MENU            = 82
        #KEY_VOLUME_UP       = 24
        #KEY_VOLUME_DOWN     = 25
    EndEnumeration

    ;// Mouse buttons
    Enumeration MouseButton
        #MOUSE_LEFT_BUTTON   = 0
        #MOUSE_RIGHT_BUTTON  = 1
        #MOUSE_MIDDLE_BUTTON = 2
    EndEnumeration

    ;// Gamepad number
    Enumeration GamepadNumber
        #GAMEPAD_PLAYER1     = 0
        #GAMEPAD_PLAYER2     = 1
        #GAMEPAD_PLAYER3     = 2
        #GAMEPAD_PLAYER4     = 3
    EndEnumeration

    ;// Gamepad Buttons
    Enumeration GamepadButton
        ;// This is here just for error checking
        #GAMEPAD_BUTTON_UNKNOWN = 0

        ;// This is normally a DPAD
        #GAMEPAD_BUTTON_LEFT_FACE_UP
        #GAMEPAD_BUTTON_LEFT_FACE_RIGHT
        #GAMEPAD_BUTTON_LEFT_FACE_DOWN
        #GAMEPAD_BUTTON_LEFT_FACE_LEFT

        ;// This normally corresponds with PlayStation and Xbox controllers
        ;// XBOX: [Y,X,A,B]
        ;// PS3: [Triangle,Square,Cross,Circle]
        ;// No support for 6 button controllers though..
        #GAMEPAD_BUTTON_RIGHT_FACE_UP
        #GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
        #GAMEPAD_BUTTON_RIGHT_FACE_DOWN
        #GAMEPAD_BUTTON_RIGHT_FACE_LEFT

        ;// Triggers
        #GAMEPAD_BUTTON_LEFT_TRIGGER_1
        #GAMEPAD_BUTTON_LEFT_TRIGGER_2
        #GAMEPAD_BUTTON_RIGHT_TRIGGER_1
        #GAMEPAD_BUTTON_RIGHT_TRIGGER_2

        ;// These are buttons in the center of the gamepad
        #GAMEPAD_BUTTON_MIDDLE_LEFT     ;//PS3 Select
        #GAMEPAD_BUTTON_MIDDLE          ;//PS Button/XBOX Button
        #GAMEPAD_BUTTON_MIDDLE_RIGHT    ;//PS3 Start

        ;// These are the joystick press in buttons
        #GAMEPAD_BUTTON_LEFT_THUMB
        #GAMEPAD_BUTTON_RIGHT_THUMB
    EndEnumeration

    Enumeration GamepadAxis
        ;// This is here just for error checking
        #GAMEPAD_AXIS_UNKNOWN = 0

        ;// Left stick
        #GAMEPAD_AXIS_LEFT_X
        #GAMEPAD_AXIS_LEFT_Y

        ;// Right stick
        #GAMEPAD_AXIS_RIGHT_X
        #GAMEPAD_AXIS_RIGHT_Y

        ;// Pressure levels for the back triggers
        #GAMEPAD_AXIS_LEFT_TRIGGER       ;// [1..-1] (pressure-level)
        #GAMEPAD_AXIS_RIGHT_TRIGGER      ;// [1..-1] (pressure-level)
    EndEnumeration

    ;// Shader location point type
    Enumeration ShaderLocationIndex
        #LOC_VERTEX_POSITION = 0
        #LOC_VERTEX_TEXCOORD01
        #LOC_VERTEX_TEXCOORD02
        #LOC_VERTEX_NORMAL
        #LOC_VERTEX_TANGENT
        #LOC_VERTEX_COLOR
        #LOC_MATRIX_MVP
        #LOC_MATRIX_MODEL
        #LOC_MATRIX_VIEW
        #LOC_MATRIX_PROJECTION
        #LOC_VECTOR_VIEW
        #LOC_COLOR_DIFFUSE
        #LOC_COLOR_SPECULAR
        #LOC_COLOR_AMBIENT
        #LOC_MAP_ALBEDO          ;// LOC_MAP_DIFFUSE
        #LOC_MAP_METALNESS       ;// LOC_MAP_SPECULAR
        #LOC_MAP_NORMAL
        #LOC_MAP_ROUGHNESS
        #LOC_MAP_OCCLUSION
        #LOC_MAP_EMISSION
        #LOC_MAP_HEIGHT
        #LOC_MAP_CUBEMAP
        #LOC_MAP_IRRADIANCE
        #LOC_MAP_PREFILTER
        #LOC_MAP_BRDF
    EndEnumeration

    #LOC_MAP_DIFFUSE  = #LOC_MAP_ALBEDO
    #LOC_MAP_SPECULAR = #LOC_MAP_METALNESS

    ;// Shader uniform data types
    Enumeration ShaderUniformDataType
        #UNIFORM_FLOAT = 0
        #UNIFORM_VEC2
        #UNIFORM_VEC3
        #UNIFORM_VEC4
        #UNIFORM_INT
        #UNIFORM_IVEC2
        #UNIFORM_IVEC3
        #UNIFORM_IVEC4
        #UNIFORM_SAMPLER2D
    EndEnumeration

    ;// Material map type
    Enumeration MaterialMapType
        #MAP_ALBEDO    = 0       ;// MAP_DIFFUSE
        #MAP_METALNESS = 1       ;// MAP_SPECULAR
        #MAP_NORMAL    = 2
        #MAP_ROUGHNESS = 3
        #MAP_OCCLUSION
        #MAP_EMISSION
        #MAP_HEIGHT
        #MAP_CUBEMAP             ;// NOTE: Uses GL_TEXTURE_CUBE_MAP
        #MAP_IRRADIANCE          ;// NOTE: Uses GL_TEXTURE_CUBE_MAP
        #MAP_PREFILTER           ;// NOTE: Uses GL_TEXTURE_CUBE_MAP
        #MAP_BRDF
    EndEnumeration

    #MAP_DIFFUSE  = #MAP_ALBEDO
    #MAP_SPECULAR = #MAP_METALNESS

    ;// Pixel formats
    ;// NOTE: Support depends on OpenGL version and platform
    Enumeration PixelFormat
        #UNCOMPRESSED_GRAYSCALE = 1     ;// 8 bit per pixel (no alpha)
        #UNCOMPRESSED_GRAY_ALPHA        ;// 8*2 bpp (2 channels)
        #UNCOMPRESSED_R5G6B5            ;// 16 bpp
        #UNCOMPRESSED_R8G8B8            ;// 24 bpp
        #UNCOMPRESSED_R5G5B5A1          ;// 16 bpp (1 bit alpha)
        #UNCOMPRESSED_R4G4B4A4          ;// 16 bpp (4 bit alpha)
        #UNCOMPRESSED_R8G8B8A8          ;// 32 bpp
        #UNCOMPRESSED_R32               ;// 32 bpp (1 channel - float)
        #UNCOMPRESSED_R32G32B32         ;// 32*3 bpp (3 channels - float)
        #UNCOMPRESSED_R32G32B32A32      ;// 32*4 bpp (4 channels - float)
        #COMPRESSED_DXT1_RGB            ;// 4 bpp (no alpha)
        #COMPRESSED_DXT1_RGBA           ;// 4 bpp (1 bit alpha)
        #COMPRESSED_DXT3_RGBA           ;// 8 bpp
        #COMPRESSED_DXT5_RGBA           ;// 8 bpp
        #COMPRESSED_ETC1_RGB            ;// 4 bpp
        #COMPRESSED_ETC2_RGB            ;// 4 bpp
        #COMPRESSED_ETC2_EAC_RGBA       ;// 8 bpp
        #COMPRESSED_PVRT_RGB            ;// 4 bpp
        #COMPRESSED_PVRT_RGBA           ;// 4 bpp
        #COMPRESSED_ASTC_4x4_RGBA       ;// 8 bpp
        #COMPRESSED_ASTC_8x8_RGBA       ;// 2 bpp
    EndEnumeration

    ;// Texture parameters: filter mode
    ;// NOTE 1: Filtering considers mipmaps if available in the texture
    ;// NOTE 2: Filter is accordingly set for minification and magnification
    Enumeration TextureFilterMode
        #FILTER_POINT = 0               ;// No filter, just pixel aproximation
        #FILTER_BILINEAR                ;// Linear filtering
        #FILTER_TRILINEAR               ;// Trilinear filtering (linear with mipmaps)
        #FILTER_ANISOTROPIC_4X          ;// Anisotropic filtering 4x
        #FILTER_ANISOTROPIC_8X          ;// Anisotropic filtering 8x
        #FILTER_ANISOTROPIC_16X         ;// Anisotropic filtering 16x
    EndEnumeration

    ;// Cubemap layout type
    Enumeration CubemapLayoutType
        #CUBEMAP_AUTO_DETECT = 0        ;// Automatically detect layout type
        #CUBEMAP_LINE_VERTICAL          ;// Layout is defined by a vertical line with faces
        #CUBEMAP_LINE_HORIZONTAL        ;// Layout is defined by an horizontal line with faces
        #CUBEMAP_CROSS_THREE_BY_FOUR    ;// Layout is defined by a 3x4 cross with cubemap faces
        #CUBEMAP_CROSS_FOUR_BY_THREE    ;// Layout is defined by a 4x3 cross with cubemap faces
        #CUBEMAP_PANORAMA               ;// Layout is defined by a panorama image (equirectangular map)
    EndEnumeration

    ;// Texture parameters: wrap mode
    Enumeration TextureWrapMode
        #WRAP_REPEAT = 0                ;// Repeats texture in tiled mode
        #WRAP_CLAMP                     ;// Clamps texture to edge pixel in tiled mode
        #WRAP_MIRROR_REPEAT             ;// Mirrors and repeats the texture in tiled mode
        #WRAP_MIRROR_CLAMP              ;// Mirrors and clamps to border the texture in tiled mode
    EndEnumeration

    ;// Font type, defines generation method
    Enumeration FontType
        #FONT_DEFAULT = 0               ;// Default font generation, anti-aliased
        #FONT_BITMAP                    ;// Bitmap font generation, no anti-aliasing
        #FONT_SDF                       ;// SDF font generation, requires external shader
    EndEnumeration

    ;// Color blending modes (pre-defined)
    Enumeration BlendMode
        #BLEND_ALPHA = 0                ;// Blend textures considering alpha (default)
        #BLEND_ADDITIVE                 ;// Blend textures adding colors
        #BLEND_MULTIPLIED               ;// Blend textures multiplying colors
    EndEnumeration

    ;// Gestures type
    ;// NOTE: It could be used as flags to enable only some gestures
    Enumeration GestureType
        #GESTURE_NONE        = 0
        #GESTURE_TAP         = 1
        #GESTURE_DOUBLETAP   = 2
        #GESTURE_HOLD        = 4
        #GESTURE_DRAG        = 8
        #GESTURE_SWIPE_RIGHT = 16
        #GESTURE_SWIPE_LEFT  = 32
        #GESTURE_SWIPE_UP    = 64
        #GESTURE_SWIPE_DOWN  = 128
        #GESTURE_PINCH_IN    = 256
        #GESTURE_PINCH_OUT   = 512
    EndEnumeration

    ;// Camera system modes
    Enumeration CameraMode
        #CAMERAMODE_CUSTOM = 0
        #CAMERAMODE_FREE
        #CAMERAMODE_ORBITAL
        #CAMERAMODE_FIRST_PERSON
        #CAMERAMODE_THIRD_PERSON
    EndEnumeration

    ;// Camera projection modes
    Enumeration CameraType
        #CAMERATYPE_PERSPECTIVE = 0
        #CAMERATYPE_ORTHOGRAPHIC
    EndEnumeration

    ;// Type of n-patch
    Enumeration NPatchType
        #NPT_9PATCH = 0          ;// Npatch defined by 3x3 tiles
        #NPT_3PATCH_VERTICAL     ;// Npatch defined by 1x3 tiles
        #NPT_3PATCH_HORIZONTAL   ;// Npatch defined by 3x1 tiles
    EndEnumeration

    ;- ---------- Enumerations End
    ;} ---------- Enumerations End


    ;- ---------- Macros Start
    ;{ ---------- Macros Start
    
    ;**************** TEMP
    Macro rl_ColorLong: l : EndMacro
    ;****************
    
    
    Macro rl_bool  : l : EndMacro
    Macro rl_int   : l : EndMacro
    Macro rl_uint  : l : EndMacro
    Macro rl_long  : i : EndMacro
    Macro rl_float : f : EndMacro
    Macro rl_double: d : EndMacro
    ;Macro rl_void :   : EndMacro
    
    Macro RLDQ
        "
    EndMacro
    
    CompilerIf #PB_Compiler_OS = #PB_OS_Windows
        CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
          Macro RLAS(__procname)
              As RLDQ#_#__procname#RLDQ
          EndMacro
          Macro __PBAS(__procname)
              As RLDQ#_pbhelper_#__procname#RLDQ
          EndMacro
        CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
          Macro RLAS(__procname)
              As RLDQ#__procname#RLDQ
          EndMacro
          Macro __PBAS(__procname)
              As RLDQ#pbhelper_#__procname#RLDQ
          EndMacro
        CompilerEndIf
    CompilerElseIf #PB_Compiler_OS = #PB_OS_Linux
        Macro RLAS(__procname)
            As RLDQ#__procname#RLDQ
        EndMacro
        Macro __PBAS(__procname)
            As RLDQ#pbhelper_#__procname#RLDQ
        EndMacro
    CompilerElseIf #PB_Compiler_OS = #PB_OS_MacOS
        Macro RLAS(__procname)
            As RLDQ#_#__procname#RLDQ
        EndMacro
        Macro __PBAS(__procname)
            As RLDQ#_pbhelper_#__procname#RLDQ
        EndMacro
    CompilerEndIf
    ;- ---------- Macros End
    ;} ---------- Macros End


    ;- ---------- Structures Start
    ;{ ---------- Structures Start
    
    ;//----------------------------------------------------------------------------------
    ;// Structures Definition
    ;//----------------------------------------------------------------------------------
    
    ;// Vector2 type
    Structure Vector2 Align #PB_Structure_AlignC
        x.rl_float
        y.rl_float
    EndStructure
    
    ;// Vector3 type
    Structure Vector3 Align #PB_Structure_AlignC
        x.rl_float
        y.rl_float
        z.rl_float
    EndStructure
    
    ;// Vector4 type
    Structure Vector4 Align #PB_Structure_AlignC
        x.rl_float
        y.rl_float
        z.rl_float
        w.rl_float
    EndStructure
    
    ;// Quaternion type, same As Vector4
    Structure Quaternion Extends Vector4 Align #PB_Structure_AlignC
    EndStructure
    
    ;// Matrix type (OpenGL style 4x4 - right handed, column major)
    Structure Matrix Align #PB_Structure_AlignC
         m0.rl_float
         m4.rl_float
         m8.rl_float
        m12.rl_float
         m1.rl_float
         m5.rl_float
         m9.rl_float
        m13.rl_float
         m2.rl_float
         m6.rl_float
        m10.rl_float
        m14.rl_float
         m3.rl_float
         m7.rl_float
        m11.rl_float
        m15.rl_float
    EndStructure
    
    ;// Color type, RGBA (32bit)
    Structure Color Align #PB_Structure_AlignC
        r.a
        g.a
        b.a
        a.a
    EndStructure
    
    ;// Rectangle type
    Structure Rectangle Align #PB_Structure_AlignC
        x.rl_float
        y.rl_float
        width.rl_float
        height.rl_float
    EndStructure
    
    ;// Image type, bpp always RGBA (32bit)
    ;// NOTE: Data stored in CPU memory (RAM)
    Structure Image Align #PB_Structure_AlignC
        *_data          ;// Image raw data
        width.rl_int    ;// Image base width
        height.rl_int   ;// Image base height
        mipmaps.rl_int  ;// Mipmap levels, 1 by default
        format.rl_int   ;// Data format (PixelFormat type)
    EndStructure
    
    ;// Texture2D type
    ;// NOTE: Data stored in GPU memory
    Structure Texture2D Align #PB_Structure_AlignC
        id.rl_uint      ;// OpenGL texture id
        width.rl_int    ;// Texture base width
        height.rl_int   ;// Texture base height
        mipmaps.rl_int  ;// Mipmap levels, 1 by default
        format.rl_int   ;// Data format (PixelFormat type)
    EndStructure
    
    ;// Texture type, same As Texture2D
    Structure Texture Extends Texture2D Align #PB_Structure_AlignC
    EndStructure
    
    ;// TextureCubemap type, actually, same As Texture2D
    Structure TextureCubemap Extends Texture2D  Align #PB_Structure_AlignC
    EndStructure
    
    ;// RenderTexture2D type, For texture rendering
    Structure RenderTexture2D Align #PB_Structure_AlignC
        id.rl_uint              ;// OpenGL Framebuffer Object (FBO) id
        texture.Texture2D       ;// Color buffer attachment texture
        depth.Texture2D         ;// Depth buffer attachment texture
        depthTexture.rl_bool    ;// Track if depth attachment is a texture or renderbuffer
    EndStructure
    
    ;// RenderTexture type, same As RenderTexture2D
    Structure RenderTexture Extends RenderTexture2D Align #PB_Structure_AlignC
    EndStructure
    
    ;// N-Patch layout info
    Structure NPatchInfo Align #PB_Structure_AlignC
        sourceRec.Rectangle     ;// Region in the texture
        left.rl_int             ;// left border offset
        top.rl_int              ;// top border offset
        right.rl_int            ;// right border offset
        bottom.rl_int           ;// bottom border offset
        type.rl_int             ;// layout of the n-patch: 3x3, 1x3 or 3x1
    EndStructure
    
    ;// Font character info
    Structure CharInfo Align #PB_Structure_AlignC
        value.rl_int            ;// Character value (Unicode)
        offsetX.rl_int          ;// Character offset X when drawing
        offsetY.rl_int          ;// Character offset Y when drawing
        advanceX.rl_int         ;// Character advance position X
        image.Image             ;// Character image data
    EndStructure
    
    ;// Font type, includes texture And charSet Array Data
    Structure Font Align #PB_Structure_AlignC
        baseSize.rl_int         ;// Base size (default chars height)
        charsCount.rl_int       ;// Number of characters
        texture.Texture2D       ;// Characters texture atlas
        *recs.Rectangle         ;// Characters rectangles in texture
        *chars.CharInfo         ;// Characters info data
    EndStructure
    
    ;// SpriteFont type fallback, defaults To Font
    Structure SpriteFont Extends Font Align #PB_Structure_AlignC
    EndStructure
    
    ;// Camera type, defines a camera position/orientation in 3d space
    Structure Camera3D Align #PB_Structure_AlignC
        position.Vector3    ;// Camera position
        target.Vector3      ;// Camera target it looks-at
        up.Vector3          ;// Camera up vector (rotation over its axis)
        fovy.rl_float       ;// Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
        type.rl_int         ;// Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    EndStructure
    
    ;// Camera type fallback, defaults to Camera3D
    Structure Camera Extends Camera3D Align #PB_Structure_AlignC
    EndStructure
    
    ;// Camera2D type, defines a 2d camera
    Structure Camera2D Align #PB_Structure_AlignC
        offset.Vector2      ;// Camera offset (displacement from target)
        target.Vector2      ;// Camera target (rotation and zoom origin)
        rotation.rl_float   ;// Camera rotation in degrees
        zoom.rl_float       ;// Camera zoom (scaling), should be 1.0f by default
    EndStructure
    
    ;// Vertex Data definning a mesh
    ;// NOTE: Data stored in CPU memory (And GPU)
    Structure Mesh Align #PB_Structure_AlignC
        vertexCount.rl_int  ;// Number of vertices stored in arrays
        triangleCount.rl_int;// Number of triangles stored (indexed or not)
    
        ;// Default vertex Data
        *vertices.Float     ;// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        *texcoords.Float    ;// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        *texcoords2.Float   ;// Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
        *normals.Float      ;// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
        *tangents.Float     ;// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
        *colors.Ascii       ;// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
        *indices.Unicode    ;// Vertex indices (in case vertex data comes indexed)
    
        ;// Animation vertex Data
        *animVertices.Float ;// Animated vertex positions (after bones transformations)
        *animNormals.Float  ;// Animated normals (after bones transformations)
        *boneIds.Long       ;// Vertex bone ids, up to 4 bones influence by vertex (skinning)
        *boneWeights.Float  ;// Vertex bone weight, up to 4 bones influence by vertex (skinning)
    
        ;// OpenGL identifiers
        vaoId.rl_uint       ;// OpenGL Vertex Array Object id
        *vboId.Long         ;// OpenGL Vertex Buffer Objects id (default vertex data)
    EndStructure
    
    ;// Shader type (generic)
    Structure Shader Align #PB_Structure_AlignC
        id.rl_uint          ;// Shader program id
        *locs.Long          ;// Shader locations array (MAX_SHADER_LOCATIONS)
    EndStructure
    
    ;// Material texture Map
    Structure MaterialMap Align #PB_Structure_AlignC
        texture.Texture2D   ;// Material map texture
        color.rl_ColorLong  ;// Material Map color
        value.rl_float      ;// Material Map value
    EndStructure
    
    ;// Material type (generic)
    Structure Material Align #PB_Structure_AlignC
        shader.Shader       ;// Material shader
        *maps.MaterialMap   ;// Material maps array (MAX_MATERIAL_MAPS)
        *params.Float       ;// Material generic parameters (if required)
    EndStructure
    
    ;// Transformation properties
    Structure Transform Align #PB_Structure_AlignC
        translation.Vector3   ;// Translation
        rotation.Quaternion   ;// Rotation
        scale.Vector3         ;// Scale
    EndStructure
    
    ;// Bone information
    Structure BoneInfo Align #PB_Structure_AlignC
        name.a[32]          ;// Bone name
        parent.rl_int       ;// Bone parent
    EndStructure
    
    ;// Model type
    Structure Model Align #PB_Structure_AlignC
        transform.Matrix      ;// Local transform matrix
    
        meshCount.rl_int      ;// Number of meshes
        *meshes.Mesh          ;// Meshes array
    
        materialCount.rl_int  ;// Number of materials
        *materials.Material   ;// Materials array
        *meshMaterial.Long      ;// Mesh material number
    
        ;// Animation Data
        boneCount.rl_int      ;// Number of bones
        *bones.BoneInfo       ;// Bones information (skeleton)
        *bindPose.Transform   ;// Bones base transformation (pose)
    EndStructure
    
    ;// Model animation
    Structure ModelAnimation Align #PB_Structure_AlignC
        boneCount.rl_int             ;// Number of bones
        *bones.BoneInfo              ;// Bones information (skeleton)
    
        frameCount.rl_int            ;// Number of animation frames
        *framePoses.rl_Transform[0]  ;// Poses array by frame
    EndStructure
    
    ;// Ray type (useful For raycast)
    Structure Ray Align #PB_Structure_AlignC
        position.Vector3        ;// Ray position (origin)
        direction.Vector3       ;// Ray direction
    EndStructure
    
    ;// Raycast hit information
    Structure RayHitInfo Align #PB_Structure_AlignC
        hit.rl_bool             ;// Did the ray hit something?
        distance.rl_float       ;// Distance to nearest hit
        position.Vector3        ;// Position of nearest hit
        normal.Vector3          ;// Surface normal of hit
    EndStructure
    
    ;// Bounding box type
    Structure BoundingBox Align #PB_Structure_AlignC
        min.Vector3             ;// Minimum vertex box-corner
        max.Vector3             ;// Maximum vertex box-corner
    EndStructure
    
    ;// Wave type, defines audio wave Data
    Structure Wave Align #PB_Structure_AlignC
        sampleCount.rl_uint     ;// Total number of samples
        sampleRate.rl_uint      ;// Frequency (samples per second)
        sampleSize.rl_uint      ;// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
        channels.rl_uint        ;// Number of channels (1-mono, 2-stereo)
        *_data                  ;// Buffer data pointer
    EndStructure
    
    Structure rAudioBuffer Align #PB_Structure_AlignC
    EndStructure
    
    ;// Audio stream type
    ;// NOTE: Useful To create custom audio streams Not bound To a specific file
    Structure AudioStream Align #PB_Structure_AlignC
        sampleRate.rl_uint      ;// Frequency (samples per second)
        sampleSize.rl_uint      ;// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
        channels.rl_uint        ;// Number of channels (1-mono, 2-stereo)
    
        *buffer.rAudioBuffer    ;// Pointer to internal data used by the audio system
    EndStructure
    
    ;// Sound source type
    Structure Sound Align #PB_Structure_AlignC
        sampleCount.rl_uint     ;// Total number of samples
        stream.AudioStream      ;// Audio stream
    EndStructure
    
    ;// Music stream type (audio file streaming from memory)
    ;// NOTE: Anything longer than ~10 seconds should be streamed
    Structure Music Align #PB_Structure_AlignC
        ctxType.rl_int          ;// Type of music context (audio filetype)
        *ctxData                ;// Audio context data, depends on type
    
        sampleCount.rl_uint     ;// Total number of samples
        loopCount.rl_uint       ;// Loops count (times music will play), 0 means infinite loop
    
        stream.AudioStream      ;// Audio stream
    EndStructure
    
    ;// Head-Mounted-Display device parameters
    Structure VrDeviceInfo Align #PB_Structure_AlignC
        hResolution.rl_int              ;// HMD horizontal resolution in pixels
        vResolution.rl_int              ;// HMD vertical resolution in pixels
        hScreenSize.rl_float            ;// HMD horizontal size in meters
        vScreenSize.rl_float            ;// HMD vertical size in meters
        vScreenCenter.rl_float          ;// HMD screen center in meters
        eyeToScreenDistance.rl_float    ;// HMD distance between eye and display in meters
        lensSeparationDistance.rl_float ;// HMD lens separation distance in meters
        interpupillaryDistance.rl_float ;// HMD IPD (distance between pupils) in meters
        lensDistortionValues.rl_float[4];// HMD lens distortion constant parameters
        chromaAbCorrection.rl_float[4]  ;// HMD chromatic aberration correction parameters
    EndStructure
    
    ;- ---------- Structures End
    ;} ---------- Structures End


    ;- ---------- Import Functions Start
    ;{ ---------- Import Functions Start
    
    ;// Callbacks To be implemented by users:
    PrototypeC TraceLogCallback(logType.rl_int, *text.Ascii)
    ;// PureBasic example for using rlTraceLogCallback():
    CompilerIf 0
    
        ProcedureC MyCustomLogger( logType.rl_int, *text.Ascii )
            Protected msg.s
            If *text
                msg.s = PeekS(*text,-1,#PB_UTF8)
            EndIf
            Debug Str(logType)+": "+msg
        EndProcedure
    
        ray::SetTraceLogLevel(#LOG_ALL)
        ray::SetTraceLogCallback( @MyCustomLogger() )
    
    CompilerEndIf
    
    ; CHANGED FUNCTION NAMES:
    ;
    ;   GetClipboardText()          =>  GetClipboardTextRaylib()
    ;   SetClipboardText()          =>  SetClipboardTextRaylib()
    ;
    ;   CloseWindow()               =>  CloseWindowRaylib()
    ;   SetWindowTitle()            =>  SetWindowTitleRaylib()
    ;   HideWindow()                =>  HideWindowRaylib()
    ;
    ;   LoadImage()                 =>  LoadImageRaylib()
    ;   ImageFormat()               =>  ImageFormatRaylib()
    ;   LoadTexture()               =>  LoadTextureRaylib()
    ;   LoadFont()                  =>  LoadFontRaylib()
    ;   DrawText()                  =>  DrawTextRaylib()
    ;
    ;   LoadSound()                 =>  LoadSoundRaylib()
    ;   PlaySound()                 =>  PlaySoundRaylib()
    ;   StopSound()                 =>  StopSoundRaylib()
    ;   PauseSound()                =>  PauseSoundRaylib()
    ;   ResumeSound()               =>  ResumeSoundRaylib()
    ;
    ;
    CompilerIf #PB_Compiler_OS = #PB_OS_Windows
        CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
            ImportC "bin/raylib_win32_pbhelper.lib"
            EndImport
            ImportC "bin/raylib_win32_dll.lib"
        CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
            ImportC "bin/raylib_win64_pbhelper.lib"
            EndImport
            ImportC "bin/raylib_win64_dll.lib"
        CompilerElse
            CompilerError "raylib for Windows: processor error"
        CompilerEndIf
    CompilerEndIf
    CompilerIf #PB_Compiler_OS = #PB_OS_Linux
        CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
            ImportC "bin/libraylib_linux_i386.a"
            EndImport
            ImportC "bin/libraylib_linux_pbhelper_i386.a"
            EndImport
            ImportC "-lc -lm -lpthread -ldl -lrt -lX11 -lXrandr -lXinerama -lXi -lXxf86vm -lXcursor -lGLESv2 -lglfw"
        CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
            ImportC "bin/libraylib_linux_amd64.a"
            EndImport
            ImportC "bin/libraylib_linux_pbhelper_amd64.a"
            EndImport
            ImportC "-lc -lm -lpthread -ldl -lrt -lX11 -lXrandr -lXinerama -lXi -lXxf86vm -lXcursor -lGLESv2 -lglfw"
        CompilerElse
            CompilerError "raylib for Linux: processor error"
        CompilerEndIf
    CompilerEndIf
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
        CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
            ImportC "bin/libraylib_macos_pbhelper_x86.a"
        CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
            ImportC "bin/libraylib_macos_pbhelper_x64.a"
        CompilerElse
            CompilerError "raylib for macOS: processor error"
        CompilerEndIf
        
        ImportC "-framework AppKit -framework IOKit -framework OpenGL"
        EndImport
        
        ImportC "bin/libraylib_macos.a"
    CompilerEndIf
        ;//------------------------------------------------------------------------------------
        ;// Window and Graphics Device Functions (Module: core)
        ;//------------------------------------------------------------------------------------
        ;
        ;// Window-related functions
        InitWindow(width.rl_int, height.rl_int, title.p-utf8)                 RLAS(InitWindow)                   ;// Initialize window and OpenGL context
        WindowShouldClose.rl_bool()                                           RLAS(WindowShouldClose)            ;// Check if KEY_ESCAPE pressed or Close icon pressed
        CloseWindowRaylib()                                                   RLAS(CloseWindow)                  ;// Close window and unload OpenGL context
        IsWindowReady.rl_bool()                                               RLAS(IsWindowReady)                ;// Check if window has been initialized successfully
        IsWindowMinimized.rl_bool()                                           RLAS(IsWindowMinimized)            ;// Check if window has been minimized (or lost focus)
        IsWindowResized.rl_bool()                                             RLAS(IsWindowResized)              ;// Check if window has been resized
        IsWindowHidden.rl_bool()                                              RLAS(IsWindowHidden)               ;// Check if window is currently hidden
        IsWindowFullscreen.rl_bool()                                          RLAS(IsWindowFullscreen)           ;// Check if window is currently fullscreen
        ToggleFullscreen()                                                    RLAS(ToggleFullscreen)             ;// Toggle fullscreen mode (only PLATFORM_DESKTOP)
        UnhideWindow()                                                        RLAS(UnhideWindow)                 ;// Show the window
        HideWindowRaylib()                                                    RLAS(HideWindow)                   ;// Hide the window
        SetWindowIcon(*in_image.ray::Image)                                 __PBAS(SetWindowIcon)                ;// Set icon for window (only PLATFORM_DESKTOP)
        SetWindowTitleRaylib(title.p-utf8)                                    RLAS(SetWindowTitle)               ;// Set title for window (only PLATFORM_DESKTOP)
        SetWindowPosition(x.rl_int, y.rl_int)                                 RLAS(SetWindowPosition)            ;// Set window position on screen (only PLATFORM_DESKTOP)
        SetWindowMonitor(monitor.rl_int)                                      RLAS(SetWindowMonitor)             ;// Set monitor for the current window (fullscreen mode)
        SetWindowMinSize(width.rl_int, height.rl_int)                         RLAS(SetWindowMinSize)             ;// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
        SetWindowSize(width.rl_int, height.rl_int)                            RLAS(SetWindowSize)                ;// Set window dimensions
        GetWindowHandle.i()                                                   RLAS(GetWindowHandle)              ;// Get native window handle
        GetScreenWidth.rl_int()                                               RLAS(GetScreenWidth)               ;// Get current screen width
        GetScreenHeight.rl_int()                                              RLAS(GetScreenHeight)              ;// Get current screen height
        GetMonitorCount.rl_int()                                              RLAS(GetMonitorCount)              ;// Get number of connected monitors
        GetMonitorWidth.rl_int(monitor.rl_int)                                RLAS(GetMonitorWidth)              ;// Get primary monitor width
        GetMonitorHeight.rl_int(monitor.rl_int)                               RLAS(GetMonitorHeight)             ;// Get primary monitor height
        GetMonitorPhysicalWidth.rl_int(monitor.rl_int)                        RLAS(GetMonitorPhysicalWidth)      ;// Get primary monitor physical width in millimetres
        GetMonitorPhysicalHeight.rl_int(monitor.rl_int)                       RLAS(GetMonitorPhysicalHeight)     ;// Get primary monitor physical height in millimetres
        GetWindowPosition(*out_result.ray::Vector2)                         __PBAS(GetWindowPosition)            ;// Get window position XY on monitor
      __GetMonitorName.i(monitor.rl_int)                                      RLAS(GetMonitorName)               ;// Get the human-readable, UTF-8 encoded name of the primary monitor
      __GetClipboardTextRaylib.i()                                            RLAS(GetClipboardText)             ;// Get clipboard text content
        SetClipboardTextRaylib(text.p-utf8)                                   RLAS(SetClipboardText)             ;// Set clipboard text content
    
        ;// Cursor-related functions
        ShowCursor()                                                          RLAS(ShowCursor)                 ;// Shows cursor
        HideCursor()                                                          RLAS(HideCursor)                 ;// Hides cursor
        IsCursorHidden.rl_bool()                                              RLAS(IsCursorHidden)             ;// Check if cursor is not visible
        EnableCursor()                                                        RLAS(EnableCursor)               ;// Enables cursor (unlock cursor)
        DisableCursor()                                                       RLAS(DisableCursor)              ;// Disables cursor (lock cursor)
    
        ;// Drawing-related functions
        ClearBackground(color.rl_ColorLong)                                   RLAS(ClearBackground)              ;// Set background color (framebuffer clear color)
        BeginDrawing()                                                        RLAS(BeginDrawing)                 ;// Setup canvas (framebuffer) to start drawing
        EndDrawing()                                                          RLAS(EndDrawing)                   ;// End canvas drawing and swap buffers (double buffering)
        BeginMode2D(*in_camera2d.ray::Camera2D)                             __PBAS(BeginMode2D)                  ;// Initialize 2D mode with custom camera (2D)
        EndMode2D()                                                           RLAS(EndMode2D)                    ;// Ends 2D mode with custom camera
        BeginMode3D(*in_camera3d.ray::Camera3D)                             __PBAS(BeginMode3D)                  ;// Initializes 3D mode with custom camera (3D)
        EndMode3D()                                                           RLAS(EndMode3D)                    ;// Ends 3D mode and returns to default 2D orthographic mode
        BeginTextureMode(*in_target.ray::RenderTexture2D)                   __PBAS(BeginTextureMode)             ;// Initializes render texture for drawing
        EndTextureMode()                                                      RLAS(EndTextureMode)               ;// Ends drawing to render texture
        BeginScissorMode(x.rl_int, y.rl_int,
                         width.rl_int, height.rl_int)                         RLAS(BeginScissorMode)             ;// Begin scissor mode (define screen area for following drawing)
        EndScissorMode()                                                      RLAS(EndScissorMode)               ;// End scissor mode
    
        ;// Screen-space-related functions
        GetMouseRay(*out_result.ray::Ray, *in_mousePosition.ray::Vector2,
                    *in_camera.ray::Camera)                                 __PBAS(GetMouseRay)                  ;// Returns a ray trace from mouse position
        GetCameraMatrix(*out_result.ray::Matrix, *in_camera.ray::Camera)    __PBAS(GetCameraMatrix)              ;// Returns camera transform matrix (view matrix)
        GetCameraMatrix2D(*out_result.ray::Matrix,*in_camera.ray::Camera2D) __PBAS(GetCameraMatrix2D)            ;// Returns camera 2d transform matrix
        GetWorldToScreen(*out_result.ray::Vector2, *in_position.ray::Vector3,
                         *in_camera.ray::Camera)                            __PBAS(GetWorldToScreen)             ;// Returns the screen space position for a 3d world space position
        GetWorldToScreenEx(*out_result.ray::Vector2, *in_position.ray::Vector3,
                           *in_camera.ray::Camera,
                           width.rl_int, height.rl_int)                     __PBAS(GetWorldToScreenEx)           ;// Returns size position for a 3d world space position
        GetWorldToScreen2D(*out_result.ray::Vector2, *in_position.ray::Vector2,
                           *in_camera.ray::Camera2D)                        __PBAS(GetWorldToScreen2D)           ;// Returns the screen space position for a 2d camera world space position
        GetScreenToWorld2D(*out_result.ray::Vector2, *in_position.ray::Vector2,
                           *in_camera.ray::Camera2D)                        __PBAS(GetScreenToWorld2D)           ;// Returns the world space position for a 2d camera screen space position
    
        ;// Timing-related functions
        SetTargetFPS(fps.rl_int)                                              RLAS(SetTargetFPS)                 ;// Set target FPS (maximum)
        GetFPS.rl_int()                                                       RLAS(GetFPS)                       ;// Returns current FPS
        GetFrameTime.rl_float()                                               RLAS(GetFrameTime)                 ;// Returns time in seconds for last frame drawn
        GetTime.rl_double()                                                   RLAS(GetTime)                      ;// Returns elapsed time in seconds since InitWindow()
    
        ;// Color-related functions
        ColorToInt.rl_int(color.rl_ColorLong)                                 RLAS(ColorToInt)                   ;// Returns hexadecimal value for a Color
        ColorNormalize(*out_result.ray::Vector4, color.rl_ColorLong)        __PBAS(ColorNormalize)               ;// Returns color normalized as float [0..1]
        ColorFromNormalized.i(*in_normalized.ray::Vector4)                  __PBAS(ColorFromNormalized)          ;// Returns color from normalized values [0..1]
        ColorToHSV(*out_result.ray::Vector3, color.rl_ColorLong)            __PBAS(ColorToHSV)                   ;// Returns HSV values for a Color
        ColorFromHSV.i(*in_hsv.ray::Vector3)                                __PBAS(ColorFromHSV)                 ;// Returns a Color from HSV values
        GetColor.rl_ColorLong(hexValue.rl_int)                                RLAS(GetColor)                     ;// Returns a Color struct from hexadecimal value
        Fade.rl_ColorLong(color.rl_ColorLong, alpha.rl_float)                 RLAS(Fade)                         ;// Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
    
        ;// Misc. functions
        SetConfigFlags(flags.rl_uint)                                         RLAS(SetConfigFlags)               ;// Setup window configuration flags (view FLAGS)
        SetTraceLogLevel(logType.rl_int)                                      RLAS(SetTraceLogLevel)             ;// Set the current threshold (minimum) log level
        SetTraceLogExit(logType.rl_int)                                       RLAS(SetTraceLogExit)              ;// Set the exit threshold (minimum) log level
        SetTraceLogCallback(callback.ray::TraceLogCallback)                 __PBAS(SetTraceLogCallback)          ;// Set a trace log callback to enable custom logging
        TraceLog(logType.rl_int, text.p-utf8)                                 RLAS(TraceLog)                     ;// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
        TakeScreenshot(fileName.p-utf8)                                       RLAS(TakeScreenshot)               ;// Takes a screenshot of current screen (saved a .png)
        GetRandomValue.rl_int(min.rl_int, max.rl_int)                         RLAS(GetRandomValue)               ;// Returns a random value between min and max (both included)
    
        ;// Files management functions
        LoadFileData.i(fileName.p-utf8, *bytesRead.Long)                      RLAS(LoadFileData)                 ;// Load file data as byte array (read)
        SaveFileData(fileName.p-utf8, *p_data, bytesToWrite.rl_uint)          RLAS(SaveFileData)                 ;// Save data to file from byte array (write)
      __LoadFileText.i(fileName.p-utf8)                                       RLAS(LoadFileText)                 ;// Load text data from file (read), returns a '\0' terminated string
        SaveFileText(fileName.p-utf8, text.p-utf8)                            RLAS(SaveFileText)                 ;// Save text data to file (write), string must be '\0' terminated
        FileExists.rl_bool(fileName.p-utf8)                                   RLAS(FileExists)                   ;// Check if file exists
        IsFileExtension.rl_bool(fileName.p-utf8, ext.p-utf8)                  RLAS(IsFileExtension)              ;// Check file extension
        DirectoryExists.rl_bool(dirPath.p-utf8)                               RLAS(DirectoryExists)              ;// Check if a directory path exists
      __GetExtension.i(fileName.p-utf8)                                       RLAS(GetExtension)                 ;// Get pointer to extension for a filename string
      __GetFileName.i(filePath.p-utf8)                                        RLAS(GetFileName)                  ;// Get pointer to filename for a path string
      __GetFileNameWithoutExt.i(filePath.p-utf8)                              RLAS(GetFileNameWithoutExt)        ;// Get filename string without extension (uses static string)
      __GetDirectoryPath.i(filePath.p-utf8)                                   RLAS(GetDirectoryPath)             ;// Get full path for a given fileName with path (uses static string)
      __GetPrevDirectoryPath.i(dirPath.p-utf8)                                RLAS(GetPrevDirectoryPath)         ;// Get previous directory path for a given path (uses static string)
      __GetWorkingDirectory.i()                                               RLAS(GetWorkingDirectory)          ;// Get current working directory (uses static string)
      __GetDirectoryFiles.i(dirPath.p-utf8, *count.Long)                      RLAS(GetDirectoryFiles)            ;// Get filenames in a directory path (memory should be freed)
        ClearDirectoryFiles()                                                 RLAS(ClearDirectoryFiles)          ;// Clear directory files paths buffers (free memory)
        ChangeDirectory.rl_bool(dir.p-utf8)                                   RLAS(ChangeDirectory)              ;// Change working directory, returns true if success
        IsFileDropped.rl_bool()                                               RLAS(IsFileDropped)                ;// Check if a file has been dropped into window
      __GetDroppedFiles.i(*count.Long)                                        RLAS(GetDroppedFiles)              ;// Get dropped files names (memory should be freed)
        ClearDroppedFiles()                                                   RLAS(ClearDroppedFiles)            ;// Clear dropped files paths buffer (free memory)
        GetFileModTime.rl_long(fileName.p-utf8)                               RLAS(GetFileModTime)               ;// Get file modification time (last write time)
        CompressData.i(*in_data, dataLength.rl_int, *compDataLength.Long)     RLAS(CompressData)                 ;// Compress data (DEFLATE algorythm)
        DecompressData.i(*in_compData,compDataLength.rl_int,*dataLength.Long) RLAS(DecompressData)               ;// Decompress data (DEFLATE algorythm)
    
        ;// Persistent storage management
        SaveStorageValue(position.rl_uint, value.rl_int)                      RLAS(SaveStorageValue)             ;// Save integer value to storage file (to defined position)
        LoadStorageValue.rl_int(position.rl_uint)                             RLAS(LoadStorageValue)             ;// Load integer value from storage file (from defined position)
    
        OpenURL(url.p-utf8)                                                   RLAS(OpenURL)                      ;// Open URL with default system browser (if available)
    
        ;//------------------------------------------------------------------------------------
        ;// Input Handling Functions (Module: core)
        ;//------------------------------------------------------------------------------------
    
        ;// Input-related functions: keyboard
        IsKeyPressed.rl_bool(key.rl_int)                                      RLAS(IsKeyPressed)                 ;// Detect if a key has been pressed once
        IsKeyDown.rl_bool(key.rl_int)                                         RLAS(IsKeyDown)                    ;// Detect if a key is being pressed
        IsKeyReleased.rl_bool(key.rl_int)                                     RLAS(IsKeyReleased)                ;// Detect if a key has been released once
        IsKeyUp.rl_bool(key.rl_int)                                           RLAS(IsKeyUp)                      ;// Detect if a key is NOT being pressed
        SetExitKey(key.rl_int)                                                RLAS(SetExitKey)                   ;// Set a custom key to exit program (default is ESC)
        GetKeyPressed.rl_int()                                                RLAS(GetKeyPressed)                ;// Get key pressed, call it multiple times for chars queued
    
        ;// Input-related functions: gamepads
        IsGamepadAvailable.rl_bool(gamepad.rl_int)                            RLAS(IsGamepadAvailable)           ;// Detect if a gamepad is available
        IsGamepadName.rl_bool(gamepad.rl_int, name.p-utf8)                    RLAS(IsGamepadName)                ;// Check gamepad name (if available)
      __GetGamepadName(gamepad.rl_int)                                        RLAS(GetGamepadName)               ;// Return gamepad internal name id
        IsGamepadButtonPressed.rl_bool(gamepad.rl_int, button.rl_int)         RLAS(IsGamepadButtonPressed)       ;// Detect if a gamepad button has been pressed once
        IsGamepadButtonDown.rl_bool(gamepad.rl_int, button.rl_int)            RLAS(IsGamepadButtonDown)          ;// Detect if a gamepad button is being pressed
        IsGamepadButtonReleased.rl_bool(gamepad.rl_int, button.rl_int)        RLAS(IsGamepadButtonReleased)      ;// Detect if a gamepad button has been released once
        IsGamepadButtonUp.rl_bool(gamepad.rl_int, button.rl_int)              RLAS(IsGamepadButtonUp)            ;// Detect if a gamepad button is NOT being pressed
        GetGamepadButtonPressed.rl_int()                                      RLAS(GetGamepadButtonPressed)      ;// Get the last gamepad button pressed
        GetGamepadAxisCount.rl_int(gamepad.rl_int)                            RLAS(GetGamepadAxisCount)          ;// Return gamepad axis count for a gamepad
        GetGamepadAxisMovement.rl_float(gamepad.rl_int, axis.rl_int)          RLAS(GetGamepadAxisMovement)       ;// Return axis movement value for a gamepad axis
    
        ;// Input-related functions: mouse
        IsMouseButtonPressed.rl_bool(button.rl_int)                           RLAS(IsMouseButtonPressed)         ;// Detect if a mouse button has been pressed once
        IsMouseButtonDown.rl_bool(button.rl_int)                              RLAS(IsMouseButtonDown)            ;// Detect if a mouse button is being pressed
        IsMouseButtonReleased.rl_bool(button.rl_int)                          RLAS(IsMouseButtonReleased)        ;// Detect if a mouse button has been released once
        IsMouseButtonUp.rl_bool(button.rl_int)                                RLAS(IsMouseButtonUp)              ;// Detect if a mouse button is NOT being pressed
        GetMouseX.rl_int()                                                    RLAS(GetMouseX)                    ;// Returns mouse position X
        GetMouseY.rl_int()                                                    RLAS(GetMouseY)                    ;// Returns mouse position Y
        GetMousePosition(*out_result.ray::Vector2)                          __PBAS(GetMousePosition)             ;// Returns mouse position XY
        SetMousePosition(x.rl_int, y.rl_int)                                  RLAS(SetMousePosition)             ;// Set mouse position XY
        SetMouseOffset(offsetX.rl_int, offsetY.rl_int)                        RLAS(SetMouseOffset)               ;// Set mouse offset
        SetMouseScale(scaleX.rl_float, scaleY.rl_float)                       RLAS(SetMouseScale)                ;// Set mouse scaling
        GetMouseWheelMove.rl_int()                                            RLAS(GetMouseWheelMove)            ;// Returns mouse wheel movement Y
    
        ;// Input-related functions: touch
        GetTouchX.rl_int()                                                    RLAS(GetTouchX)                  ;// Returns touch position X for touch point 0 (relative to screen size)
        GetTouchY.rl_int()                                                    RLAS(GetTouchY)                  ;// Returns touch position Y for touch point 0 (relative to screen size)
        GetTouchPosition(*out_result.ray::Vector2, index.rl_int)            __PBAS(GetTouchPosition)           ;// Returns touch position XY for a touch point index (relative to screen size)
    
        ;//------------------------------------------------------------------------------------
        ;// Gestures and Touch Handling Functions (Module: gestures)
        ;//------------------------------------------------------------------------------------
        SetGesturesEnabled(gestureFlags.rl_uint)                              RLAS(SetGesturesEnabled)           ;// Enable a set of gestures using flags
        IsGestureDetected.rl_bool(gesture.rl_int)                             RLAS(IsGestureDetected)            ;// Check if a gesture have been detected
        GetGestureDetected.rl_int()                                           RLAS(GetGestureDetected)           ;// Get latest detected gesture
        GetTouchPointsCount.rl_int()                                          RLAS(GetTouchPointsCount)          ;// Get touch points count
        GetGestureHoldDuration.rl_float()                                     RLAS(GetGestureHoldDuration)       ;// Get gesture hold time in milliseconds
        GetGestureDragVector(*out_result.ray::Vector2)                      __PBAS(GetGestureDragVector)         ;// Get gesture drag vector
        GetGestureDragAngle.rl_float()                                        RLAS(GetGestureDragAngle)          ;// Get gesture drag angle
        GetGesturePinchVector(*out_result.ray::Vector2)                     __PBAS(GetGesturePinchVector)        ;// Get gesture pinch delta
        GetGesturePinchAngle.rl_float()                                       RLAS(GetGesturePinchAngle)         ;// Get gesture pinch angle
    
        ;//------------------------------------------------------------------------------------
        ;// Camera System Functions (Module: camera)
        ;//------------------------------------------------------------------------------------
        SetCameraMode(*in_camera.ray::Camera, cameraMode.rl_int)            __PBAS(SetCameraMode)                ;// Set camera mode (multiple camera modes available)
        UpdateCamera(*inout_camera.ray::Camera)                               RLAS(UpdateCamera)                 ;// Update camera position for selected mode
    
        SetCameraPanControl(panKey.rl_int)                                    RLAS(SetCameraPanControl)          ;// Set camera pan key to combine with mouse movement (free camera)
        SetCameraAltControl(altKey.rl_int)                                    RLAS(SetCameraAltControl)          ;// Set camera alt key to combine with mouse movement (free camera)
        SetCameraSmoothZoomControl(szKey.rl_int)                              RLAS(SetCameraSmoothZoomControl)   ;// Set camera smooth zoom key to combine with mouse (free camera)
        SetCameraMoveControls( frontKey.rl_int, backKey.rl_int,
                               rightKey.rl_int, leftKey.rl_int,
                               upKey.rl_int   , downKey.rl_int )              RLAS(SetCameraMoveControls)        ;// Set camera move controls (1st person and 3rd person cameras)
    
        ;//------------------------------------------------------------------------------------
        ;// Basic Shapes Drawing Functions (Module: shapes)
        ;//------------------------------------------------------------------------------------
    
        ;// Basic shapes drawing functions
        DrawPixel(posX.rl_int, posY.rl_int, color.rl_ColorLong)               RLAS(DrawPixel)                    ;// Draw a pixel
        DrawPixelV(*in_position.ray::Vector2, color.rl_ColorLong)           __PBAS(DrawPixelV)                   ;// Draw a pixel (Vector version)
        DrawLine(startPosX.rl_int, startPosY.rl_int,
                 endPosX.rl_int  , endPosY.rl_int  , color.rl_ColorLong)      RLAS(DrawLine)                     ;// Draw a line
        DrawLineV(*in_startPos.ray::Vector2, *in_endPos.ray::Vector2,
                  color.rl_ColorLong)                                       __PBAS(DrawLineV)                    ;// Draw a line (Vector version)
        DrawLineEx(*in_startPos.ray::Vector2, *in_endPos.ray::Vector2,
                   thick.rl_float, color.rl_ColorLong)                      __PBAS(DrawLineEx)                   ;// Draw a line defining thickness
        DrawLineBezier(*in_startPos.ray::Vector2, *in_endPos.ray::Vector2,
                       thick.rl_float, color.rl_ColorLong)                  __PBAS(DrawLineBezier)               ;// Draw a line using cubic-bezier curves in-out
        DrawLineStrip(*in_pointsArray.ray::Vector2, numPoints.rl_int,
                      color.rl_ColorLong)                                     RLAS(DrawLineStrip)                ;// Draw lines sequence
        DrawCircle(centerX.rl_int , centerY.rl_int,
                   radius.rl_float, color.rl_ColorLong)                       RLAS(DrawCircle)                   ;// Draw a color-filled circle
        DrawCircleSector(*in_center.ray::Vector2, radius.rl_float,
                         startAngle.rl_int, endAngle.rl_int,
                         segments.rl_int, color.rl_ColorLong)               __PBAS(DrawCircleSector)             ;// Draw a piece of a circle
        DrawCircleSectorLines(*in_center.ray::Vector2, radius.rl_float,
                              startAngle.rl_int, endAngle.rl_int,
                              segments.rl_int, color.rl_ColorLong)          __PBAS(DrawCircleSectorLines)        ;    // Draw circle sector outline
        DrawCircleGradient(centerX.rl_int, centerY.rl_int, radius.rl_float,
                           color1.rl_ColorLong, color2.rl_ColorLong)          RLAS(DrawCircleGradient)           ;// Draw a gradient-filled circle
        DrawCircleV(*in_center.ray::Vector2, radius.rl_float,
                    color.rl_ColorLong)                                     __PBAS(DrawCircleV)                  ;// Draw a color-filled circle (Vector version)
        DrawCircleLines(centerX.rl_int , centerY.rl_int,
                        radius.rl_float, color.rl_ColorLong)                  RLAS(DrawCircleLines)              ;// Draw circle outline
        DrawEllipse(centerX.rl_int  , centerY.rl_int  ,
                    radiusH.rl_float, radiusV.rl_float, color.rl_ColorLong)   RLAS(DrawEllipse)                  ;// Draw ellipse
        DrawEllipseLines(centerX.rl_int  , centerY.rl_int  ,
                         radiusH.rl_float, radiusV.rl_float,
                         color.rl_ColorLong)                                  RLAS(DrawEllipseLines)             ;// Draw ellipse outline
        DrawRing(*in_center.ray::Vector2,
                 innerRadius.rl_float, outerRadius.rl_float,
                 startAngle.rl_int, endAngle.rl_int,
                 segments.rl_int, color.rl_ColorLong)                       __PBAS(DrawRing)                     ; // Draw ring
        DrawRingLines(*in_center.ray::Vector2,
                      innerRadius.rl_float, outerRadius.rl_float,
                      startAngle.rl_int, endAngle.rl_int,
                      segments.rl_int, color.rl_ColorLong)                  __PBAS(DrawRingLines)                ;// Draw ring outline
        DrawRectangle(posX.rl_int, posY.rl_int, width.rl_int, height.rl_int,
                      color.rl_ColorLong)                                     RLAS(DrawRectangle)                ;// Draw a color-filled rectangle
        DrawRectangleV(*in_position.ray::Vector2, *in_size.ray::Vector2,
                       color.rl_ColorLong)                                  __PBAS(DrawRectangleV)               ;// Draw a color-filled rectangle (Vector version)
        DrawRectangleRec(*in_rect.ray::Rectangle, color.rl_ColorLong)       __PBAS(DrawRectangleRec)             ;// Draw a color-filled rectangle
        DrawRectanglePro(*in_rect.ray::Rectangle, *in_origin.ray::Vector2,
                         rotation.rl_float, color.rl_ColorLong)             __PBAS(DrawRectanglePro)             ;// Draw a color-filled rectangle with pro parameters
        DrawRectangleGradientV(posX.rl_int , posY.rl_int  ,
                               width.rl_int, height.rl_int,
                               color1.rl_ColorLong, color2.rl_ColorLong)      RLAS(DrawRectangleGradientV)       ;// Draw a vertical-gradient-filled rectangle
        DrawRectangleGradientH(posX.rl_int , posY.rl_int  ,
                               width.rl_int, height.rl_int,
                               color1.rl_ColorLong, color2.rl_ColorLong)      RLAS(DrawRectangleGradientH)       ;// Draw a horizontal-gradient-filled rectangle
        DrawRectangleGradientEx(*in_rect.ray::Rectangle,
                                col1.rl_ColorLong, col2.rl_ColorLong,
                                col3.rl_ColorLong, col4.rl_ColorLong)       __PBAS(DrawRectangleGradientEx)      ;// Draw a gradient-filled rectangle with custom vertex colors
        DrawRectangleLines(posX.rl_int , posY.rl_int  ,
                           width.rl_int, height.rl_int, color.rl_ColorLong)   RLAS(DrawRectangleLines)           ;// Draw rectangle outline
        DrawRectangleLinesEx(*in_rect.ray::Rectangle, lineThick.rl_int,
                             color.rl_ColorLong)                            __PBAS(DrawRectangleLinesEx)         ;// Draw rectangle outline with extended parameters
        DrawRectangleRounded(*in_rect.ray::Rectangle, roundness.rl_float,
                             segments.rl_int, color.rl_ColorLong)           __PBAS(DrawRectangleRounded)         ;// Draw rectangle with rounded edges
        DrawRectangleRoundedLines(*in_rect.ray::Rectangle,
                                  roundness.rl_float, segments.rl_int,
                                  lineThick.rl_int, color.rl_ColorLong)     __PBAS(DrawRectangleRoundedLines)    ; // Draw rectangle with rounded edges outline
        DrawTriangle(*in_v1.ray::Vector2, *in_v2.ray::Vector2,
                     *in_v3.ray::Vector2, color.rl_ColorLong)               __PBAS(DrawTriangle)                 ;// Draw a color-filled triangle (vertex in counter-clockwise order!)
        DrawTriangleLines(*in_v1.ray::Vector2, *in_v2.ray::Vector2,
                          *in_v3.ray::Vector2, color.rl_ColorLong)          __PBAS(DrawTriangleLines)            ;// Draw triangle outline (vertex in counter-clockwise order!)
        DrawTriangleFan(*in_pointsArray.ray::Vector2, numPoints.rl_int,
                        color.rl_ColorLong)                                   RLAS(DrawTriangleFan)              ;// Draw a triangle fan defined by points (first vertex is the center)
        DrawTriangleStrip(*in_pointsArray.ray::Vector2, pointsCount.rl_int,
                          color.rl_ColorLong)                                 RLAS(DrawTriangleStrip)            ;// Draw a triangle strip defined by points
        DrawPoly(*in_center.ray::Vector2, sides.rl_int, radius.rl_float,
                 rotation.rl_float, color.rl_ColorLong)                     __PBAS(DrawPoly)                     ;// Draw a regular polygon (Vector version)
        DrawPolyLines(*in_center.ray::Vector2, sides.rl_int, radius.rl_float,
                      rotation.rl_float, color.rl_ColorLong)                __PBAS(DrawPolyLines)                ;// Draw a polygon outline of n sides
    
        ;// Basic shapes collision detection functions
        CheckCollisionRecs.rl_bool(*in_rect1.ray::Rectangle,
                                   *in_rect2.ray::Rectangle)                __PBAS(CheckCollisionRecs)           ;// Check collision between two rectangles
        CheckCollisionCircles.rl_bool(*in_center1.ray::Vector2,
                                      radius1.rl_float,
                                      *in_center2.ray::Vector2,
                                      radius2.rl_float)                     __PBAS(CheckCollisionCircles)        ;// Check collision between two circles
        CheckCollisionCircleRec.rl_bool(*in_center.ray::Vector2,
                                        radius.rl_float,
                                        *in_rect.ray::Rectangle)            __PBAS(CheckCollisionCircleRec)      ;// Check collision between circle and rectangle
        GetCollisionRec(*out_result.ray::Rectangle,
                        *in_rect1.ray::Rectangle,
                        *in_rect2.ray::Rectangle)                           __PBAS(GetCollisionRec)              ;// Get collision rectangle for two rectangles collision
        CheckCollisionPointRec.rl_bool(*in_point.ray::Vector2,
                                       *in_rect.ray::Rectangle)             __PBAS(CheckCollisionPointRec)       ;// Check if point is inside rectangle
        CheckCollisionPointCircle.rl_bool(*in_point.ray::Vector2,
                                          *in_center.ray::Vector2,
                                          radius.rl_float)                  __PBAS(CheckCollisionPointCircle)    ;// Check if point is inside circle
        CheckCollisionPointTriangle.rl_bool(*in_point.ray::Vector2,
                                            *in_p1.ray::Vector2,
                                            *in_p2.ray::Vector2,
                                            *in_p3.ray::Vector2)            __PBAS(CheckCollisionPointTriangle)  ;// Check if point is inside a triangle
    
        ;//------------------------------------------------------------------------------------
        ;// Texture Loading and Drawing Functions (Module: textures)
        ;//------------------------------------------------------------------------------------
    
        ;// Image loading functions
        ;// NOTE: This functions do not require GPU access
        LoadImageRaylib.i(*out_result.ray::Image, fileName.p-utf8)          __PBAS(LoadImage)                    ;// Load image from file into CPU memory (RAM)
        LoadImageEx(*out_result.ray::Image, *pixels.Long,
                    width.rl_int, height.rl_int)                            __PBAS(LoadImageEx)                  ;// Load image from Color array data (RGBA - 32bit)
        LoadImagePro(*out_result.ray::Image, *_data,
                     width.rl_int, height.rl_int, format.rl_int)            __PBAS(LoadImagePro)                 ;// Load image from raw data with parameters
        LoadImageRaw(*out_result.ray::Image, fileName.p-utf8,
                     width.rl_int, height.rl_int, format.rl_int,
                     headerSize.rl_int)                                     __PBAS(LoadImageRaw)                 ;// Load image from RAW file data
        UnloadImage(*in_image.ray::Image)                                   __PBAS(UnloadImage)                  ;// Unload image from CPU memory (RAM)
        ExportImage(*in_image.ray::Image, fileName.p-utf8)                  __PBAS(ExportImage)                  ;// Export image data to file
        ExportImageAsCode(*in_image.ray::Image, fileName.p-utf8)            __PBAS(ExportImageAsCode)            ;// Export image as code file defining an array of bytes
        GetImageData.i(*in_image.ray::Image)                                __PBAS(GetImageData)                 ;// Get pixel data from image as a Color struct array, returns *pointer_to.ray::Color
        GetImageDataNormalized.i(*in_image.ray::Image)                      __PBAS(GetImageDataNormalized)       ;// Get pixel data from image as Vector4 array (float normalized), returns *pointer_to.ray::Vector4
    
        ;// Image generation functions
        GenImageColor(*out_image.ray::Image, width.rl_int, height.rl_int,
                      color.rl_ColorLong)                                   __PBAS(GenImageColor)                ;// Generate image: plain color
        GenImageGradientV(*out_image.ray::Image, width.rl_int, height.rl_int,
                          top.rl_ColorLong, bottom.rl_ColorLong)            __PBAS(GenImageGradientV)            ;// Generate image: vertical gradient
        GenImageGradientH(*out_image.ray::Image, width.rl_int, height.rl_int,
                          left.rl_ColorLong, right.rl_ColorLong)            __PBAS(GenImageGradientH)            ;// Generate image: horizontal gradient
        GenImageGradientRadial(*out_image.ray::Image, width.rl_int, height.rl_int,
                               density.rl_float,
                               inner.rl_ColorLong, outer.rl_ColorLong)      __PBAS(GenImageGradientRadial)       ;// Generate image: radial gradient
        GenImageChecked(*out_image.ray::Image, width.rl_int, height.rl_int,
                        checksX.rl_int, checksY.rl_int,
                        col1.rl_ColorLong, col2.rl_ColorLong)               __PBAS(GenImageChecked)              ;// Generate image: checked
        GenImageWhiteNoise(*out_image.ray::Image, width.rl_int, height.rl_int,
                           factor.rl_float)                                 __PBAS(GenImageWhiteNoise)           ;// Generate image: white noise
        GenImagePerlinNoise(*out_image.ray::Image, width.rl_int, height.rl_int,
                            offsetX.rl_int, offsetY.rl_int, scale.rl_float) __PBAS(GenImagePerlinNoise)          ;// Generate image: perlin noise
        GenImageCellular(*out_image.ray::Image, width.rl_int, height.rl_int,
                         tileSize.rl_int)                                   __PBAS(GenImageCellular)             ;// Generate image: cellular algorithm. Bigger tileSize means bigger cells
    
        ;// Image manipulation functions
        ImageCopy(*out_copy.ray::Image, *in_sourceImage.ray::Image)         __PBAS(ImageCopy)                    ;// Create an image duplicate (useful for transformations)
        ImageFromImage(*out_image.ray::Image, *in_sourceImage.ray::Image,
                       *in_rect.ray::Rectangle)                             __PBAS(ImageFromImage)               ;// Create an image from another image piece
        ImageText(*out_image.ray::Image, text.p-utf8, fontSize.rl_int,
                  color.rl_ColorLong)                                       __PBAS(ImageText)                    ;// Create an image from text (default font)
        ImageTextEx(*out_image.ray::Image, *in_font.ray::Font,
                    text.p-utf8, fontSize.rl_float, spacing.rl_float,
                    tint.rl_ColorLong)                                      __PBAS(ImageTextEx)                  ;// Create an image from text (custom sprite font)
        ImageToPOT(*inout_image.ray::Image, fillColor.rl_ColorLong)           RLAS(ImageToPOT)                   ;// Convert image to POT (power-of-two)
        ImageFormatRaylib(*inout_image.ray::Image, newFormat.rl_int)          RLAS(ImageFormat)                  ;// Convert image data to desired format
        ImageAlphaMask(*inout_image.ray::Image, *in_alphaMask.ray::Image)   __PBAS(ImageAlphaMask)               ;// Apply alpha mask to image
        ImageAlphaClear(*inout_image.ray::Image, color.rl_ColorLong,
                        threshold.rl_float)                                   RLAS(ImageAlphaClear)              ;// Clear alpha channel to desired color
        ImageAlphaCrop(*inout_image.ray::Image, threshold.rl_float)           RLAS(ImageAlphaCrop)               ;// Crop image depending on alpha value
        ImageAlphaPremultiply(*inout_image.ray::Image)                        RLAS(ImageAlphaPremultiply)        ;// Premultiply alpha channel
        ImageCrop(*inout_image.ray::Image, *in_crop.ray::Rectangle)         __PBAS(ImageCrop)                    ;// Crop an image to a defined rectangle
        ImageResize(*inout_image.ray::Image,
                    newWidth.rl_int, newHeight.rl_int)                        RLAS(ImageResize)                  ;// Resize image (Bicubic scaling algorithm)
        ImageResizeNN(*inout_image.ray::Image,
                      newWidth.rl_int, newHeight.rl_int)                      RLAS(ImageResizeNN)                ;// Resize image (Nearest-Neighbor scaling algorithm)
        ImageResizeCanvas(*inout_image.ray::Image,
                          newWidth.rl_int, newHeight.rl_int,
                          offsetX.rl_int, offsetY.rl_int,
                          color.rl_ColorLong)                                 RLAS(ImageResizeCanvas)            ;// Resize canvas and fill with color
        ImageMipmaps(*inout_image.ray::Image)                                 RLAS(ImageMipmaps)                 ;// Generate all mipmap levels for a provided image
        ImageDither(*inout_image.ray::Image, rBpp.rl_int, gBpp.rl_int,
                    bBpp.rl_int, aBpp.rl_int)                                 RLAS(ImageDither)                  ;// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
        ImageFlipVertical(*inout_image.ray::Image)                            RLAS(ImageFlipVertical)            ;// Flip image vertically
        ImageFlipHorizontal(*inout_image.ray::Image)                          RLAS(ImageFlipHorizontal)          ;// Flip image horizontally
        ImageRotateCW(*inout_image.ray::Image)                                RLAS(ImageRotateCW)                ;// Rotate image clockwise 90deg
        ImageRotateCCW(*inout_image.ray::Image)                               RLAS(ImageRotateCCW)               ;// Rotate image counter-clockwise 90deg
        ImageColorTint(*inout_image.ray::Image, color.rl_ColorLong)           RLAS(ImageColorTint)               ;// Modify image color: tint
        ImageColorInvert(*inout_image.ray::Image)                             RLAS(ImageColorInvert)             ;// Modify image color: invert
        ImageColorGrayscale(*inout_image.ray::Image)                          RLAS(ImageColorGrayscale)          ;// Modify image color: grayscale
        ImageColorContrast(*inout_image.ray::Image, contrast.rl_float)        RLAS(ImageColorContrast)           ;// Modify image color: contrast (-100 to 100)
        ImageColorBrightness(*inout_image.ray::Image, brightness.rl_int)      RLAS(ImageColorBrightness)         ;// Modify image color: brightness (-255 to 255)
        ImageColorReplace(*inout_image.ray::Image,
                          color.rl_ColorLong, replace.rl_ColorLong)           RLAS(ImageColorReplace)            ;// Modify image color: replace color
        ImageExtractPalette.i(*in_image.ray::Image, maxPaletteSize.rl_int,
                              *extractCount.Long)                           __PBAS(ImageExtractPalette)          ;// Extract color palette from image to maximum size (memory should be freed), returns *pointer_to.ray::Color
        GetImageAlphaBorder(*out_resultRect.ray::Rectangle,
                            *in_image.ray::Image, threshold.rl_float)       __PBAS(GetImageAlphaBorder)          ;// Get image alpha border rectangle
    
        ;// Image drawing functions
        ;// NOTE: Image software-rendering functions (CPU)
        ImageClearBackground(*inout_image.ray::Image, color.rl_ColorLong)     RLAS(ImageClearBackground)         ;// Clear image background with given color
        ImageDrawPixel(*inout_image.ray::Image, posX.rl_int, posY.rl_int,
                       color.rl_ColorLong)                                    RLAS(ImageDrawPixel)               ;// Draw pixel within an image
        ImageDrawPixelV(*inout_image.ray::Image, *in_position.ray::Vector2,
                        color.rl_ColorLong)                                 __PBAS(ImageDrawPixelV)              ;// Draw pixel within an image (Vector version)
        ImageDrawLine(*inout_image.ray::Image,
                      startPosX.rl_int, startPosY.rl_int,
                      endPosX.rl_int, endPosY.rl_int,
                      color.rl_ColorLong)                                     RLAS(ImageDrawLine)                ;// Draw line within an image
        ImageDrawLineV(*inout_image.ray::Image, *in_start.ray::Vector2,
                       *in_end.ray::Vector2, color.rl_ColorLong)            __PBAS(ImageDrawLineV)               ;// Draw line within an image (Vector version)
        ImageDrawCircle(*inout_image.ray::Image,
                        centerX.rl_int, centerY.rl_int, radius.rl_int,
                        color.rl_ColorLong)                                   RLAS(ImageDrawCircle)              ;// Draw circle within an image
        ImageDrawCircleV(*inout_image.ray::Image, *in_center.ray::Vector2,
                        radius.rl_int, color.rl_ColorLong)                  __PBAS(ImageDrawCircleV)             ;// Draw circle within an image (Vector version)
        ImageDrawRectangle(*inout_image.ray::Image, posX.rl_int, posY.rl_int,
                           width.rl_int, height.rl_int, color.rl_ColorLong)   RLAS(ImageDrawRectangle)           ;// Draw rectangle within an image
        ImageDrawRectangleV(*inout_image.ray::Image, *in_position.ray::Vector2,
                           *in_size.ray::Vector2, color.rl_ColorLong)       __PBAS(ImageDrawRectangleV)          ;// Draw rectangle within an image (Vector version)
        ImageDrawRectangleRec(*inout_image.ray::Image, *in_rec.ray::Rectangle,
                             color.rl_ColorLong)                            __PBAS(ImageDrawRectangleRec)        ;// Draw rectangle within an image
        ImageDrawRectangleLines(*inout_image.ray::Image, *in_rec.ray::Rectangle,
                               thick.rl_int, color.rl_ColorLong)            __PBAS(ImageDrawRectangleLines)      ;// Draw rectangle lines within an image
        ImageDraw(*inout_image.ray::Image, *in_src.ray::Image,
                 *in_srcRec.ray::Rectangle, *in_dstRec.ray::Rectangle,
                 tint.rl_ColorLong)                                         __PBAS(ImageDraw)                    ;// Draw a source image within a destination image (tint applied to source)
        ImageDrawText(*inout_image.ray::Image, *in_position.ray::Vector2,
                     text.p-utf8, fontSize.rl_int, color.rl_ColorLong)      __PBAS(ImageDrawText)                ;// Draw text (default font) within an image (destination)
        ImageDrawTextEx(*inout_image.ray::Image, *in_position.ray::Vector2,
                       *in_font.ray::Font, text.p-utf8, fontSize.rl_float,
                       spacing.rl_float, color.rl_ColorLong)                __PBAS(ImageDrawTextEx)              ; // Draw text (custom sprite font) within an image (destination)
    
        ;// Texture loading functions
        ;// NOTE: These functions require GPU access
        LoadTextureRaylib(*out_texture.ray::Texture2D, fileName.p-utf8)     __PBAS(LoadTexture)                  ;// Load texture from file into GPU memory (VRAM)
        LoadTextureFromImage(*out_texture.ray::Texture2D,
                             *in_image.ray::Image )                         __PBAS(LoadTextureFromImage)         ;// Load texture from image data
        LoadTextureCubemap(*out_cubemap.ray::TextureCubemap,
                           *in_image.ray::Image, layoutType.rl_int)         __PBAS(LoadTextureCubemap)           ;// Load cubemap from image, multiple image cubemap layouts supported
        LoadRenderTexture(*out_renderTexture.ray::RenderTexture2D,
                          width.rl_int, height.rl_int)                      __PBAS(LoadRenderTexture)            ;// Load texture for rendering (framebuffer)
        UnloadTexture(*inout_texture.ray::Texture2D)                        __PBAS(UnloadTexture)                ;// Unload texture from GPU memory (VRAM)
        UnloadRenderTexture(*inout_target.ray::RenderTexture2D)             __PBAS(UnloadRenderTexture)          ;// Unload render texture from GPU memory (VRAM)
        UpdateTexture(*inout_texture.ray::Texture2D, *pixels)               __PBAS(UpdateTexture)                ;// Update GPU texture with new data, format of *pixels is texture\format (Enumeration PixelFormat)
        GetTextureData(*out_image.ray::Image, *in_texture.ray::Texture2D)   __PBAS(GetTextureData)               ;// Get pixel data from GPU texture and return an Image
        GetScreenData(*out_image.ray::Image)                                __PBAS(GetScreenData)                ;// Get pixel data from screen buffer and return an Image (screenshot)
    
        ;// Texture configuration functions
        GenTextureMipmaps(*inout_texture.ray::Texture2D)                      RLAS(GenTextureMipmaps)            ;// Generate GPU mipmaps for a texture
        SetTextureFilter(*in_texture.ray::Texture2D, filterMode.rl_int)     __PBAS(SetTextureFilter)             ;// Set texture scaling filter mode
        SetTextureWrap(*in_texture.ray::Texture2D, wrapMode.rl_int)         __PBAS(SetTextureWrap)               ;// Set texture wrapping mode
    
        ;// Texture drawing functions
        DrawTexture(*in_texture.ray::Texture2D, posX.rl_int,
                    posY.rl_int, tint.rl_ColorLong)                         __PBAS(DrawTexture)                  ;// Draw a Texture2D
        DrawTextureV(*in_texture.ray::Texture2D,
                     *in_position.ray::Vector2, tint.rl_ColorLong)          __PBAS(DrawTextureV)                 ;// Draw a Texture2D with position defined as Vector2
        DrawTextureEx(*in_texture.ray::Texture2D,
                      *in_position.ray::Vector2, rotation.rl_float,
                      scale.rl_float, tint.rl_ColorLong)                    __PBAS(DrawTextureEx)                ;// Draw a Texture2D with extended parameters
        DrawTextureRec(*in_texture.ray::Texture2D, *in_sourceRec.ray::Rectangle,
                       *in_position.ray::Vector2, tint.rl_ColorLong)        __PBAS(DrawTextureRec)               ;// Draw a part of a texture defined by a rectangle
        DrawTextureQuad(*in_texture.ray::Texture2D, *in_tiling.ray::Vector2,
                        *in_offset.ray::Vector2, *in_quad.ray::Rectangle,
                        tint.rl_ColorLong)                                  __PBAS(DrawTextureQuad)              ;// Draw texture quad with tiling and offset parameters
        DrawTexturePro(*in_texture.ray::Texture2D,
                       *in_sourceRec.ray::Rectangle, *in_destRec.ray::Rectangle,
                       *in_origin.ray::Vector2, rotation.rl_float,
                       tint.rl_ColorLong)                                   __PBAS(DrawTexturePro)               ;// Draw a part of a texture defined by a rectangle with 'pro' parameters
        DrawTextureNPatch(*in_texture.ray::Texture2D,
                          *in_nPatchInfo.ray::NPatchInfo,
                          *in_destRec.ray::Rectangle, *in_origin.ray::Vector2,
                          rotation.rl_float, tint.rl_ColorLong)             __PBAS(DrawTextureNPatch)            ;// Draws a texture (or part of it) that stretches or shrinks nicely
    
        ;// Image/Texture misc functions
        GetPixelDataSize.rl_int(width.rl_int, height.rl_int, format.rl_int)   RLAS(GetPixelDataSize)             ;// Get pixel data size in bytes (image or texture)
    
        ;//------------------------------------------------------------------------------------
        ;// Font Loading and Text Drawing Functions (Module: text)
        ;//------------------------------------------------------------------------------------
    
        ;// Font loading/unloading functions
        GetFontDefault(*out_font.ray::Font)                                 __PBAS(GetFontDefault)               ;// Get the default Font
        LoadFontRaylib(*out_font.ray::Font, fileName.p-utf8)                __PBAS(LoadFont)                     ;// Load font from file into GPU memory (VRAM)
        LoadFontEx(*out_font.ray::Font, fileName.p-utf8,
                   fontSize.rl_int, *fontChars.Long, charsCount.rl_int)     __PBAS(LoadFontEx)                   ;// Load font from file with extended parameters
        LoadFontFromImage(*out_font.ray::Font, *in_image.ray::Image,
                          key.rl_ColorLong, firstChar.rl_int)               __PBAS(LoadFontFromImage)            ;// Load font from Image (XNA style)
        LoadFontData.i(fileName.p-utf8, fontSize.rl_int, *out_fontChars.Long,
                       charsCount.rl_int, type.rl_int)                        RLAS(LoadFontData)                 ;// Load font data for further use
        GenImageFontAtlas(*out_font.ray::Image, *in_chars.ray::CharInfo,
                          *recs, charsCount.rl_int, fontSize.rl_int,
                          padding.rl_int, packMethod.rl_int)                __PBAS(GenImageFontAtlas)            ;// Generate image font atlas using chars info
        UnloadFont(*in_font.ray::Font)                                      __PBAS(UnloadFont)                   ;// Unload Font from GPU memory (VRAM)
    
        ;// Text drawing functions
        DrawFPS(posX.rl_int, posY.rl_int)                                     RLAS(DrawFPS)                      ;// Shows current FPS
        DrawTextRaylib(text.p-utf8, posX.rl_int, posY.rl_int,
                       fontSize.rl_int, color.rl_ColorLong)                   RLAS(DrawText)                     ;// Draw text (using default font)
        DrawTextEx(*in_font.ray::Font, text.p-utf8,
                   *in_position.ray::Vector2, fontSize.rl_float,
                   spacing.rl_float, tint.rl_ColorLong)                     __PBAS(DrawTextEx)                   ;// Draw text using font and additional parameters
        DrawTextRec(*in_font.ray::Font, text.p-utf8,
                    *in_rec.ray::Rectangle, fontSize.rl_float,
                    spacing.rl_float, wordWrap.rl_bool, tint.rl_ColorLong)  __PBAS(DrawTextRec)                  ;// Draw text using font inside rectangle limits
        DrawTextRecEx(*in_font.ray::Font, text.p-utf8,
                      *in_rec.ray::Rectangle, fontSize.rl_float,
                      spacing.rl_float, wordWrap.rl_bool, tint.rl_ColorLong,
                      selectStart.rl_int, selectLength.rl_int,
                      selectTint.rl_ColorLong, selectBackTint.rl_ColorLong) __PBAS(DrawTextRecEx)                ;// Draw text using font inside rectangle limits with support for text selection
        DrawTextCodepoint(*in_font.ray::Font, codepoint.rl_int,
                          *in_position.ray::Vector2, scale.rl_float,
                          tint.rl_ColorLong)                                __PBAS(DrawTextCodepoint)            ;// Draw one character (codepoint)
    
        ;// Text misc. functions
        MeasureText.rl_int(text.p-utf8, fontSize.rl_int)                    __PBAS(MeasureText)                  ;// Measure string width for default font
        MeasureTextEx(*out_result.ray::Vector2, *in_font.ray::Font,
                      text.p-utf8, fontSize.rl_float, spacing.rl_float)     __PBAS(MeasureTextEx)                ;// Measure string size for Font
        GetGlyphIndex.rl_int(*in_font.ray::Font, codepoint.rl_int)          __PBAS(GetGlyphIndex)                ;// Get index position for a unicode character on font
    
        ;// Text strings management functions (no utf8 strings, only byte chars)
        ;// NOTE: Some strings allocate memory internally for returned strings, just be careful!
    ;RLAPI int TextCopy(char *dst, const char *src);                                             // Copy one string to another, returns bytes copied
    ;RLAPI bool TextIsEqual(const char *text1, const char *text2);                               // Check if two text string are equal
    ;RLAPI unsigned int TextLength(const char *text);                                            // Get text length, checks for '\0' ending
    ;RLAPI const char *TextFormat(const char *text, ...);                                        // Text formatting with variables (sprintf style)
    ;RLAPI const char *TextSubtext(const char *text, int position, int length);                  // Get a piece of a text string
    ;RLAPI char *TextReplace(char *text, const char *replace, const char *by);                   // Replace text string (memory must be freed!)
    ;RLAPI char *TextInsert(const char *text, const char *insert, int position);                 // Insert text in a position (memory must be freed!)
    ;RLAPI const char *TextJoin(const char **textList, int count, const char *delimiter);        // Join text strings with delimiter
    ;RLAPI const char **TextSplit(const char *text, char delimiter, int *count);                 // Split text into multiple strings
    ;RLAPI void TextAppend(char *text, const char *append, int *position);                       // Append text at specific position and move cursor!
    ;RLAPI int TextFindIndex(const char *text, const char *find);                                // Find first text occurrence within a string
    ;RLAPI const char *TextToUpper(const char *text);                      // Get upper case version of provided string
    ;RLAPI const char *TextToLower(const char *text);                      // Get lower case version of provided string
    ;RLAPI const char *TextToPascal(const char *text);                     // Get Pascal case notation version of provided string
    ;RLAPI int TextToInteger(const char *text);                            // Get integer value from text (negative values not supported)
    ;RLAPI char *TextToUtf8(int *codepoints, int length);                  // Encode text codepoint into utf8 text (memory must be freed!)
    
        ;// UTF8 text strings management functions
        GetCodepoints.i(text.p-utf8, *out_count.Long)                         RLAS(GetCodepoints)                ;// Get all codepoints in a string, codepoints count returned by parameters
        GetCodepointsCount.rl_int(text.p-utf8)                                RLAS(GetCodepointsCount)           ;// Get total number of characters (codepoints) in a UTF8 encoded string
        GetNextCodepoint.rl_int(text.p-utf8, *out_bytesProcessed.Long)        RLAS(GetNextCodepoint)             ;// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
      __CodepointToUtf8.i(codepoint.rl_int, *out_byteLength.Long)             RLAS(CodepointToUtf8)              ;// Encode codepoint into utf8 text (char array length returned as parameter)
    
        ;//------------------------------------------------------------------------------------
        ;// Basic 3d Shapes Drawing Functions (Module: models)
        ;//------------------------------------------------------------------------------------
    
        ;// Basic geometric 3D shapes drawing functions
        DrawLine3D(*in_startPos.ray::Vector3, *in_endPos.ray::Vector3,
                   color.rl_ColorLong)                                      __PBAS(DrawLine3D)                   ;// Draw a line in 3D world space
        DrawPoint3D(*in_position.ray::Vector3, color.rl_ColorLong)          __PBAS(DrawPoint3D)                  ;// Draw a point in 3D space, actually a small line
        DrawCircle3D(*in_center.ray::Vector3, radius.rl_float,
                     *in_rotationAxis.ray::Vector3, rotationAngle.rl_float,
                     color.rl_ColorLong)                                    __PBAS(DrawCircle3D)                 ;// Draw a circle in 3D world space
        DrawCube(*in_position.ray::Vector3, width.rl_float,
                 height.rl_float, length.rl_float, color.rl_ColorLong)      __PBAS(DrawCube)                     ;// Draw cube
        DrawCubeV(*in_position.ray::Vector3, *in_size.ray::Vector3,
                  color.rl_ColorLong)                                       __PBAS(DrawCubeV)                    ;// Draw cube (Vector version)
        DrawCubeWires(*in_position.ray::Vector3, width.rl_float,
                      height.rl_float, length.rl_float, color.rl_ColorLong) __PBAS(DrawCubeWires)                ;// Draw cube wires
        DrawCubeWiresV(*in_position.ray::Vector3, *in_size.ray::Vector3,
                       color.rl_ColorLong)                                  __PBAS(DrawCubeWiresV)               ;// Draw cube wires (Vector version)
        DrawCubeTexture(*in_texture.ray::Texture2D, *in_position.ray::Vector3,
                        width.rl_float, height.rl_float, length.rl_float,
                        color.rl_ColorLong)                                 __PBAS(DrawCubeTexture)              ;// Draw cube textured
        DrawSphere(*in_centerPos.ray::Vector3, radius.rl_float,
                   color.rl_ColorLong)                                      __PBAS(DrawSphere)                   ;// Draw sphere
        DrawSphereEx(*in_centerPos.ray::Vector3, radius.rl_float,
                     rings.rl_int, slices.rl_int, color.rl_ColorLong)       __PBAS(DrawSphereEx)                 ;// Draw sphere with extended parameters
        DrawSphereWires(*in_centerPos.ray::Vector3, radius.rl_float,
                        rings.rl_int, slices.rl_int, color.rl_ColorLong)    __PBAS(DrawSphereWires)              ;// Draw sphere wires
        DrawCylinder(*in_position.ray::Vector3, radiusTop.rl_float,
                     radiusBottom.rl_float, height.rl_float,
                     slices.rl_int, color.rl_ColorLong)                     __PBAS(DrawCylinder)                 ;// Draw a cylinder/cone
        DrawCylinderWires(*in_position.ray::Vector3, radiusTop.rl_float,
                          radiusBottom.rl_float, height.rl_float,
                          slices.rl_int, color.rl_ColorLong)                __PBAS(DrawCylinderWires)            ;//Draw a cylinder/cone wires
        DrawPlane(*in_centerPos.ray::Vector3, *in_size.ray::Vector2,
                  color.rl_ColorLong)                                       __PBAS(DrawPlane)                    ;// Draw a plane XZ
        DrawRay(*in_ray.ray::Ray, color.rl_ColorLong)                       __PBAS(DrawRay)                      ;// Draw a ray line
        DrawGrid(slices.rl_int, spacing.rl_float)                             RLAS(DrawGrid)                     ;// Draw a grid (centered at (0, 0, 0))
        DrawGizmo(*in_position.ray::Vector3)                                __PBAS(DrawGizmo)                    ;// Draw simple gizmo
        ;//DrawTorus(), DrawTeapot() could be useful?
    
        ;//------------------------------------------------------------------------------------
        ;// Model 3d Loading and Drawing Functions (Module: models)
        ;//------------------------------------------------------------------------------------
    
        ;// Model loading/unloading functions
        LoadModel(*out_result.ray::Model, fileName.p-utf8)                  __PBAS(LoadModel)                    ;// Load model from files (meshes and materials)
        LoadModelFromMesh(*out_result.ray::Model, *in_mesh.ray::Mesh)       __PBAS(LoadModelFromMesh)            ;// Load model from generated mesh (default material)
        UnloadModel(*in_model.ray::Model)                                   __PBAS(UnloadModel)                  ;// Unload model from memory (RAM and/or VRAM)
    
        ;// Mesh loading/unloading functions
        LoadMeshes.i(fileName.p-utf8, *out_meshCount.Long)                    RLAS(LoadMeshes)                   ;// Load meshes from model file, returns *pointer_to.ray::Mesh
        ExportMesh(*in_mesh.ray::Mesh, fileName.p-utf8)                     __PBAS(ExportMesh)                   ;// Export mesh data to file
        UnloadMesh(*in_mesh.ray::Mesh)                                      __PBAS(UnloadMesh)                   ;// Unload mesh from memory (RAM and/or VRAM)
    
        ;// Material loading/unloading functions
        LoadMaterials.i(fileName.p-utf8, *out_materialCount.Long)             RLAS(LoadMaterials)                ;// Load materials from model file, returns *pointer_to.ray::Material
        LoadMaterialDefault(*out_material.ray::Material)                    __PBAS(LoadMaterialDefault)          ;// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
        UnloadMaterial(*in_material.ray::Material)                          __PBAS(UnloadMaterial)               ;// Unload material from GPU memory (VRAM)
        SetMaterialTexture(*in_material.ray::Material, mapType.rl_int,
                           *in_texture.ray::Texture2D)                      __PBAS(SetMaterialTexture)           ;// Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
        SetModelMeshMaterial(*in_model.ray::Model, meshId.rl_int,
                             materialId.rl_int)                               RLAS(SetModelMeshMaterial)         ;// Set material for a mesh
    
        ;// Model animations loading/unloading functions
        LoadModelAnimations.i(fileName.p-utf8, *out_animsCount.Long)          RLAS(LoadModelAnimations)          ;// Load model animations from file, returns *pointer_to.ray::ModelAnimation
        UpdateModelAnimation(*in_model.ray::Model,
                             *in_anim.ray::ModelAnimation, frame.rl_int)    __PBAS(UpdateModelAnimation)         ;// Update model animation pose
        UnloadModelAnimation(*in_anim.ray::ModelAnimation)                  __PBAS(UnloadModelAnimation)         ;// Unload animation data
        IsModelAnimationValid.rl_bool(*in_model.ray::Model,
                                      *in_anim.ray::ModelAnimation)         __PBAS(IsModelAnimationValid)        ;// Check model animation skeleton match
    
        ;// Mesh generation functions
        GenMeshPoly(*out_mesh.ray::Mesh, sides.rl_int, radius.rl_float)     __PBAS(GenMeshPoly)                  ;// Generate polygonal mesh
        GenMeshPlane(*out_mesh.ray::Mesh, width.rl_float, length.rl_float,
                     resX.rl_int, resZ.rl_int)                              __PBAS(GenMeshPlane)                 ;// Generate plane mesh (with subdivisions)
        GenMeshCube(*out_mesh.ray::Mesh, width.rl_float,
                    height.rl_float, length.rl_float)                       __PBAS(GenMeshCube)                  ;// Generate cuboid mesh
        GenMeshSphere(*out_mesh.ray::Mesh, radius.rl_float,
                      rings.rl_int, slices.rl_int)                          __PBAS(GenMeshSphere)                ;// Generate sphere mesh (standard sphere)
        GenMeshHemiSphere(*out_mesh.ray::Mesh, radius.rl_float,
                          rings.rl_int, slices.rl_int)                      __PBAS(GenMeshHemiSphere)            ;// Generate half-sphere mesh (no bottom cap)
        GenMeshCylinder(*out_mesh.ray::Mesh, radius.rl_float,
                        height.rl_float, slices.rl_int)                     __PBAS(GenMeshCylinder)              ;// Generate cylinder mesh
        GenMeshTorus(*out_mesh.ray::Mesh, radius.rl_float, size.rl_float,
                     radSeg.rl_int, sides.rl_int)                           __PBAS(GenMeshTorus)                 ;// Generate torus mesh
        GenMeshKnot(*out_mesh.ray::Mesh, radius.rl_float, size.rl_float,
                    radSeg.rl_int, sides.rl_int)                            __PBAS(GenMeshKnot)                  ;// Generate trefoil knot mesh
        GenMeshHeightmap(*out_mesh.ray::Mesh, *in_heightmap.ray::Image,
                         *in_size.ray::Vector3)                             __PBAS(GenMeshHeightmap)             ;// Generate heightmap mesh from image data
        GenMeshCubicmap(*out_mesh.ray::Mesh, *in_cubicmap.ray::Image,
                        *in_cubeSize.ray::Vector3)                          __PBAS(GenMeshCubicmap)              ;// Generate cubes-based map mesh from image data
    
        ;// Mesh manipulation functions
        MeshBoundingBox(*out_boundingBox.ray::BoundingBox,
                        *in_mesh.ray::Mesh)                                 __PBAS(MeshBoundingBox)              ;// Compute mesh bounding box limits
        MeshTangents(*in_mesh.ray::Mesh)                                      RLAS(MeshTangents)                 ;// Compute mesh tangents
        MeshBinormals(*in_mesh.ray::Mesh)                                     RLAS(MeshBinormals)                ;// Compute mesh binormals
    
        ;// Model drawing functions
        DrawModel(*in_model.ray::Model, *in_position.ray::Vector3,
                  scale.rl_float, tint.rl_ColorLong)                        __PBAS(DrawModel)                    ;// Draw a model (with texture if set)
        DrawModelEx(*in_model.ray::Model, *in_position.ray::Vector3,
                    *in_rotationAxis.ray::Vector3, rotationAngle.rl_float,
                    *in_scale.ray::Vector3, tint.rl_ColorLong)              __PBAS(DrawModelEx)                  ;// Draw a model with extended parameters
        DrawModelWires(*in_model.ray::Model, *in_position.ray::Vector3,
                       scale.rl_float, tint.rl_ColorLong)                   __PBAS(DrawModelWires)               ;// Draw a model wires (with texture if set)
        DrawModelWiresEx(*in_model.ray::Model, *in_position.ray::Vector3,
                         *in_rotationAxis.ray::Vector3, rotationAngle.rl_float,
                         *in_scale.ray::Vector3, tint.rl_ColorLong)         __PBAS(DrawModelWiresEx)             ;// Draw a model wires (with texture if set) with extended parameters
        DrawBoundingBox(*in_box.ray::BoundingBox, color.rl_ColorLong)       __PBAS(DrawBoundingBox)              ;// Draw bounding box (wires)
        DrawBillboard(*in_camera.ray::Camera, *in_texture.ray::Texture2D,
                      *in_center.ray::Vector3, size.rl_float,
                      tint.rl_ColorLong)                                    __PBAS(DrawBillboard)                ;// Draw a billboard texture
        DrawBillboardRec(*in_camera.ray::Camera, *in_texture.ray::Texture2D,
                         *in_sourceRec.ray::Rectangle, *in_center.ray::Vector3,
                         size.rl_float, tint.rl_ColorLong)                  __PBAS(DrawBillboardRec)             ;// Draw a billboard texture defined by sourceRec
    
        ;// Collision detection functions
        CheckCollisionSpheres.rl_bool(*in_centerA.ray::Vector3,
                                      radiusA.rl_float,
                                      *in_centerB.ray::Vector3,
                                      radiusB.rl_float)                     __PBAS(CheckCollisionSpheres)        ;// Detect collision between two spheres
        CheckCollisionBoxes.rl_bool(*in_box1.ray::BoundingBox,
                                    *in_box2.ray::BoundingBox)              __PBAS(CheckCollisionBoxes)          ;// Detect collision between two bounding boxes
        CheckCollisionBoxSphere.rl_bool(*in_box.ray::BoundingBox,
                                        *in_center.ray::Vector3,
                                        radius.rl_float)                    __PBAS(CheckCollisionBoxSphere)      ;// Detect collision between box and sphere
        CheckCollisionRaySphere.rl_bool(*in_ray.ray::Ray,
                                        *in_center.ray::Vector3,
                                        radius.rl_float)                    __PBAS(CheckCollisionRaySphere)      ;// Detect collision between ray and sphere
        CheckCollisionRaySphereEx.rl_bool(*in_ray.ray::Ray,
                                        *in_center.ray::Vector3,
                                        radius.rl_float,
                                        *out_collisionPoint.ray::Vector3)   __PBAS(CheckCollisionRaySphereEx)    ;// Detect collision between ray and sphere, returns collision point
        CheckCollisionRayBox.rl_bool(*in_ray.ray::Ray,
                                     *in_box.ray::BoundingBox)              __PBAS(CheckCollisionRayBox)         ;// Detect collision between ray and box
        GetCollisionRayModel(*out_hitInfo.ray::RayHitInfo,
                             *in_ray.ray::Ray,
                             *in_model.ray::Model)                          __PBAS(GetCollisionRayModel)         ;// Get collision info between ray and model
        GetCollisionRayTriangle(*out_hitInfo.ray::RayHitInfo,
                                *in_ray.ray::Ray, *in_p1.ray::Vector3,
                                *in_p2.ray::Vector3, *in_p3.ray::Vector3)   __PBAS(GetCollisionRayTriangle)      ;// Get collision info between ray and triangle
        GetCollisionRayGround(*out_hitInfo.ray::RayHitInfo,
                              *in_ray.ray::Ray, groundHeight.rl_float)      __PBAS(GetCollisionRayGround)        ;// Get collision info between ray and ground plane (Y-normal plane)
    
        ;//------------------------------------------------------------------------------------
        ;// Shaders System Functions (Module: rlgl)
        ;// NOTE: This functions are useless when using OpenGL 1.1
        ;//------------------------------------------------------------------------------------
    
        ;// Shader loading/unloading functions
        LoadShader(*out_result.ray::Shader, vsFileName.p-utf8,
                   fsFileName.p-utf8)                                       __PBAS(LoadShader)                   ;// Load shader from files and bind default locations
        LoadShaderCode(*out_result.ray::Shader, vsCode.p-utf8,
                       fsCode.p-utf8)                                       __PBAS(LoadShaderCode)               ;// Load shader from code strings and bind default locations
        UnloadShader(*in_shader.ray::Shader)                                __PBAS(UnloadShader)                 ;// Unload shader from GPU memory (VRAM)
    
        GetShaderDefault(*out_result.ray::Shader)                           __PBAS(GetShaderDefault)             ;// Get default shader
        GetTextureDefault(*out_result.ray::Texture2D)                       __PBAS(GetTextureDefault)            ;// Get default texture
        GetShapesTexture(*out_result.ray::Texture2D)                        __PBAS(GetShapesTexture)             ;// Get texture to draw shapes
        GetShapesTextureRec(*out_result.ray::Rectangle)                     __PBAS(GetShapesTextureRec)          ;// Get texture rectangle to draw shapes
        SetShapesTexture(*in_texture.ray::Texture2D,
                         *in_source.ray::Rectangle)                         __PBAS(SetShapesTexture)             ;// Define default texture used to draw shapes
    
        ;// Shader configuration functions
        GetShaderLocation.rl_int(*in_shader.ray::Shader,
                                 uniformName.p-utf8)                        __PBAS(GetShaderLocation)            ;// Get shader uniform location
        SetShaderValue(*in_shader.ray::Shader, uniformLoc.rl_int,
                       *value, uniformType.rl_int)                          __PBAS(SetShaderValue)               ;// Set shader uniform value
        SetShaderValueV(*in_shader.ray::Shader, uniformLoc.rl_int,
                        *value, uniformType.rl_int, count.rl_int)           __PBAS(SetShaderValueV)              ;// Set shader uniform value vector
        SetShaderValueMatrix(*in_shader.ray::Shader, uniformLoc.rl_int,
                             *in_mat.ray::Matrix)                           __PBAS(SetShaderValueMatrix)         ;// Set shader uniform value (matrix 4x4)
        SetShaderValueTexture(*in_shader.ray::Shader, uniformLoc.rl_int,
                              *in_texture.ray::Texture2D)                   __PBAS(SetShaderValueTexture)        ;// Set shader uniform value for texture
        SetMatrixProjection(*in_proj.ray::Matrix)                           __PBAS(SetMatrixProjection)          ;// Set a custom projection matrix (replaces internal projection matrix)
        SetMatrixModelview(*in_view.ray::Matrix)                            __PBAS(SetMatrixModelview)           ;// Set a custom modelview matrix (replaces internal modelview matrix)
        GetMatrixModelview(*out_result.ray::Matrix)                         __PBAS(GetMatrixModelview)           ;// Get internal modelview matrix
        GetMatrixProjection(*out_result.ray::Matrix)                        __PBAS(GetMatrixProjection)          ;// Get internal projection matrix
    
        ;// Texture maps generation (PBR)
        ;// NOTE: Required shaders should be provided
        GenTextureCubemap(*out_result.ray::Texture2D, *in_shader.ray::Shader,
                          *in_map.ray::Texture2D, size.rl_int)              __PBAS(GenTextureCubemap)            ;// Generate cubemap texture from 2D texture
        GenTextureIrradiance(*out_result.ray::Texture2D,
                             *in_shader.ray::Shader,
                             *in_cubemap.ray::Texture2D, size.rl_int)       __PBAS(GenTextureIrradiance)         ;// Generate irradiance texture using cubemap data
        GenTexturePrefilter(*out_result.ray::Texture2D,
                            *in_shader.ray::Shader,
                            *in_cubemap.ray::Texture2D, size.rl_int)        __PBAS(GenTexturePrefilter)          ;// Generate prefilter texture using cubemap data
        GenTextureBRDF(*out_result.ray::Texture2D, *in_shader.ray::Shader,
                       size.rl_int)                                         __PBAS(GenTextureBRDF)               ;// Generate BRDF texture
    
        ;// Shading begin/end functions
        BeginShaderMode(*in_shader.ray::Shader)                             __PBAS(BeginShaderMode)              ;// Begin custom shader drawing
        EndShaderMode()                                                       RLAS(EndShaderMode)                ;// End custom shader drawing (use default shader)
        BeginBlendMode(mode.rl_int)                                           RLAS(BeginBlendMode)               ;// Begin blending mode (alpha, additive, multiplied)
        EndBlendMode()                                                        RLAS(EndBlendMode)                 ;// End blending mode (reset to default: alpha blending)
    
        ;// VR control functions
        InitVrSimulator()                                                     RLAS(InitVrSimulator)              ;// Init VR simulator for selected device parameters
        CloseVrSimulator()                                                    RLAS(CloseVrSimulator)             ;// Close VR simulator for current device
        UpdateVrTracking(*inout_camera.ray::Camera)                           RLAS(UpdateVrTracking)             ;// Update VR tracking (position and orientation) and camera
        SetVrConfiguration(*in_info.ray::VrDeviceInfo,
                           *in_distortion.ray::Shader)                      __PBAS(SetVrConfiguration)           ;// Set stereo rendering configuration parameters
        IsVrSimulatorReady.rl_bool()                                          RLAS(IsVrSimulatorReady)           ;// Detect if VR simulator is ready
        ToggleVrMode()                                                        RLAS(ToggleVrMode)                 ;// Enable/Disable VR experience
        BeginVrDrawing()                                                      RLAS(BeginVrDrawing)               ;// Begin VR simulator stereo rendering
        EndVrDrawing()                                                        RLAS(EndVrDrawing)                 ;// End VR simulator stereo rendering
    
        ;//------------------------------------------------------------------------------------
        ;// Audio Loading and Playing Functions (Module: audio)
        ;//------------------------------------------------------------------------------------
    
        ;// Audio device management functions
        InitAudioDevice()                                                     RLAS(InitAudioDevice)              ;// Initialize audio device and context
        CloseAudioDevice()                                                    RLAS(CloseAudioDevice)             ;// Close the audio device and context
        IsAudioDeviceReady.rl_bool()                                          RLAS(IsAudioDeviceReady)           ;// Check if audio device has been initialized successfully
        SetMasterVolume(volume.rl_float)                                      RLAS(SetMasterVolume)              ;// Set master volume (listener)
    
        ;// Wave/Sound loading/unloading functions
        LoadWave(*out_result.ray::Wave, fileName.p-utf8)                    __PBAS(LoadWave)                     ;// Load wave data from file
        LoadSoundRaylib(*out_result.ray::Sound, fileName.p-utf8)            __PBAS(LoadSound)                    ;// Load sound from file
        LoadSoundFromWave(*out_result.ray::Sound, *in_wave.ray::Wave)       __PBAS(LoadSoundFromWave)            ;// Load sound from wave data
        UpdateSound(*inout_sound.ray::Sound, *in_data, samplesCount.rl_int) __PBAS(UpdateSound)                  ;// Update sound buffer with new data
        UnloadWave(*in_wave.ray::Wave)                                      __PBAS(UnloadWave)                   ;// Unload wave data
        UnloadSound(*in_sound.ray::Sound)                                   __PBAS(UnloadSound)                  ;// Unload sound
        ExportWave(*in_wave.ray::Wave, fileName.p-utf8)                     __PBAS(ExportWave)                   ;// Export wave data to file
        ExportWaveAsCode(*in_wave.ray::Wave, fileName.p-utf8)               __PBAS(ExportWaveAsCode)             ;// Export wave sample data to code (.h)
    
        ;// Wave/Sound management functions
        PlaySoundRaylib(*in_sound.ray::Sound)                               __PBAS(PlaySound)                    ;// Play a sound
        StopSoundRaylib(*in_sound.ray::Sound)                               __PBAS(StopSound)                    ;// Stop playing a sound
        PauseSoundRaylib(*in_sound.ray::Sound)                              __PBAS(PauseSound)                   ;// Pause a sound
        ResumeSoundRaylib(*in_sound.ray::Sound)                             __PBAS(ResumeSound)                  ;// Resume a paused sound
        PlaySoundMulti(*in_sound.ray::Sound)                                __PBAS(PlaySoundMulti)               ;// Play a sound (using multichannel buffer pool)
        StopSoundMulti()                                                      RLAS(StopSoundMulti)               ;// Stop any sound playing (using multichannel buffer pool)
        GetSoundsPlaying.rl_int()                                             RLAS(GetSoundsPlaying)             ;// Get number of sounds playing in the multichannel
        IsSoundPlaying.rl_bool(*in_sound.ray::Sound)                        __PBAS(IsSoundPlaying)               ;// Check if a sound is currently playing
        SetSoundVolume(*in_sound.ray::Sound, volume.rl_float)               __PBAS(SetSoundVolume)               ;// Set volume for a sound (1.0 is max level)
        SetSoundPitch(*in_sound.ray::Sound, pitch.rl_float)                 __PBAS(SetSoundPitch)                ;// Set pitch for a sound (1.0 is base level)
        WaveFormat(*inout_wave.ray::Wave, sampleRate.rl_int,
                   sampleSize.rl_int, channels.rl_int)                        RLAS(WaveFormat)                   ;// Convert wave data to desired format
        WaveCopy(*out_result.ray::Wave, *in_sourceWave.ray::Wave)           __PBAS(WaveCopy)                     ;// Copy a wave to a new wave
        WaveCrop(*inout_wave.ray::Wave, initSample.rl_int,
                 finalSample.rl_int)                                          RLAS(WaveCrop)                     ;// Crop a wave to defined samples range
        GetWaveData.i(*in_wave.ray::Wave)                                   __PBAS(GetWaveData)                  ;// Get samples data from wave as a floats array, return *pointer_to.Float
    
        ;// Music management functions
        LoadMusicStream(*out_result.ray::Music, fileName.p-utf8)            __PBAS(LoadMusicStream)              ;// Load music stream from file
        UnloadMusicStream(*in_music.ray::Music)                             __PBAS(UnloadMusicStream)            ;// Unload music stream
        PlayMusicStream(*in_music.ray::Music)                               __PBAS(PlayMusicStream)              ;// Start music playing
        UpdateMusicStream(*in_music.ray::Music)                             __PBAS(UpdateMusicStream)            ;// Updates buffers for music streaming
        StopMusicStream(*in_music.ray::Music)                               __PBAS(StopMusicStream)              ;// Stop music playing
        PauseMusicStream(*in_music.ray::Music)                              __PBAS(PauseMusicStream)             ;// Pause music playing
        ResumeMusicStream(*in_music.ray::Music)                             __PBAS(ResumeMusicStream)            ;// Resume playing paused music
        IsMusicPlaying.rl_bool(*in_music.ray::Music)                        __PBAS(IsMusicPlaying)               ;// Check if music is playing
        SetMusicVolume(*in_music.ray::Music, volume.rl_float)               __PBAS(SetMusicVolume)               ;// Set volume for music (1.0 is max level)
        SetMusicPitch(*in_music.ray::Music, pitch.rl_float)                 __PBAS(SetMusicPitch)                ;// Set pitch for a music (1.0 is base level)
        SetMusicLoopCount(*in_music.ray::Music, count.rl_int)               __PBAS(SetMusicLoopCount)            ;// Set music loop count (loop repeats)
        GetMusicTimeLength.rl_float(*in_music.ray::Music)                   __PBAS(GetMusicTimeLength)           ;// Get music time length (in seconds)
        GetMusicTimePlayed.rl_float(*in_music.ray::Music)                   __PBAS(GetMusicTimePlayed)           ;// Get current music time played (in seconds)
    
        ;// AudioStream management functions
        InitAudioStream(*out_result.ray::AudioStream, sampleRate.rl_uint,
                        sampleSize.rl_uint, channels.rl_uint)               __PBAS(InitAudioStream)              ;// Init audio stream (to stream raw audio pcm data)
        UpdateAudioStream(*in_stream.ray::AudioStream, *in_data,
                          samplesCount.rl_int)                              __PBAS(UpdateAudioStream)            ;// Update audio stream buffers with data
        CloseAudioStream(*in_stream.ray::AudioStream)                       __PBAS(CloseAudioStream)             ;// Close audio stream and free memory
        IsAudioStreamProcessed.rl_bool(*in_stream.ray::AudioStream)         __PBAS(IsAudioStreamProcessed)       ;// Check if any audio stream buffers requires refill
        PlayAudioStream(*in_stream.ray::AudioStream)                        __PBAS(PlayAudioStream)              ;// Play audio stream
        PauseAudioStream(*in_stream.ray::AudioStream)                       __PBAS(PauseAudioStream)             ;// Pause audio stream
        ResumeAudioStream(*in_stream.ray::AudioStream)                      __PBAS(ResumeAudioStream)            ;// Resume audio stream
        IsAudioStreamPlaying.rl_bool(*in_stream.ray::AudioStream)           __PBAS(IsAudioStreamPlaying)         ;// Check if audio stream is playing
        StopAudioStream(*in_stream.ray::AudioStream)                        __PBAS(StopAudioStream)              ;// Stop audio stream
        SetAudioStreamVolume(*in_stream.ray::AudioStream, volume.rl_float)  __PBAS(SetAudioStreamVolume)         ;// Set volume for audio stream (1.0 is max level)
        SetAudioStreamPitch(*in_stream.ray::AudioStream, pitch.rl_float)    __PBAS(SetAudioStreamPitch)          ;// Set pitch for audio stream (1.0 is base level)
        SetAudioStreamBufferSizeDefault(size.rl_int)                          RLAS(SetAudioStreamBufferSizeDefault) ;// Default size for new audio streams
    
        ;//------------------------------------------------------------------------------------
        ;// Network (Module: network)
        ;//------------------------------------------------------------------------------------
    
        ;// IN PROGRESS: Check rnet.h for reference
    
    EndImport

    ;- ---------- Import Functions End
    ;} ---------- Import Functions End

    ;
    ; raylib helper procedures
    ;
    Declare.s GetMonitorName(monitor.rl_int)
    Declare.s GetClipboardTextRaylib()
    Declare.s LoadFileText(fileName.s)
    Declare.s GetExtension(fileName.s)
    Declare.s GetFileName(filePath.s)
    Declare.s GetFileNameWithoutExt(filePath.s)
    Declare.s GetDirectoryPath(filePath.s)
    Declare.s GetPrevDirectoryPath(dirPath.s)
    Declare.s GetWorkingDirectory()
    Declare.i GetDirectoryFiles(Array out_filenames.s(1), dirPath.s)
    Declare.i GetDroppedFiles(Array out_dropped_file_names.s(1))
    Declare.s GetGamepadName(gamepad.rl_int)
    Declare.s CodepointToUtf8(codepoint.rl_int)
    ;
    ; New procedures
    ;
    Declare InitVector2(*out.ray::Vector2, x.f = 0.0, y.f = 0.0)
    Declare InitVector3(*out.ray::Vector3, x.f = 0.0, y.f = 0.0, z.f = 0.0)
    Declare InitVector4(*out.ray::Vector4, x.f = 0.0, y.f = 0.0, z.f = 0.0, w.f = 0.0)
    Declare InitRectangle(*out.ray::Rectangle, x.f = 0.0, y.f = 0.0, width.f = 0.0, height.f = 0.0)

EndDeclareModule
;- ---------- DeclareModule End
;} ---------- DeclareModule End



;- ---------- Module Start
;{ ---------- Module Start

Module ray

    ;
    ; Raylib helper procedures
    ;
    Procedure.s GetMonitorName(monitor.rl_int)
        Protected *p_char = ray::__GetMonitorName(monitor)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetClipboardTextRaylib()
        Protected *p_char = ray::__GetClipboardTextRaylib()
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s LoadFileText(fileName.s)
        Protected *p_char = ray::__LoadFileText(fileName)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetExtension(fileName.s)
        Protected *p_char = ray::__GetExtension(fileName)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetFileName(filePath.s)
        Protected *p_char = ray::__GetFileName(filePath)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetFileNameWithoutExt(filePath.s)
        Protected *p_char = ray::__GetFileNameWithoutExt(filePath)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetDirectoryPath(filePath.s)
        Protected *p_char = ray::__GetDirectoryPath(filePath)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetPrevDirectoryPath(dirPath.s)
        Protected *p_char = ray::__GetPrevDirectoryPath(dirPath)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s GetWorkingDirectory()
        Protected *p_char = ray::__GetWorkingDirectory()
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.i GetDirectoryFiles(Array out_filenames.s(1), dirPath.s)
        Protected cnt.l, i.i
        ReDim out_filenames(0)
        Protected *p.Integer = ray::__GetDirectoryFiles(dirPath, @cnt)
        If cnt
            ReDim out_filenames(cnt)
            For i = 0 To cnt-1
                out_filenames(i) = PeekS(*p\i,-1,#PB_UTF8)
                *p + SizeOf(Integer)
            Next
        EndIf
        ProcedureReturn cnt
    EndProcedure
    
    Procedure.i GetDroppedFiles(Array out_dropped_file_names.s(1))
        Protected cnt.l, i.i
        ReDim out_dropped_file_names(0)
        Protected *p.Integer = ray::__GetDroppedFiles(@cnt)
        If cnt
            ReDim out_dropped_file_names(cnt)
            For i = 0 To cnt-1
                out_dropped_file_names(i) = PeekS(*p\i,-1,#PB_UTF8)
                *p + SizeOf(Integer)
            Next
        EndIf
        ProcedureReturn cnt
    EndProcedure
    
    Procedure.s GetGamepadName(gamepad.rl_int)
        Protected *p_char = ray::__GetGamepadName(gamepad)
        If *p_char
            ProcedureReturn PeekS(*p_char,-1,#PB_UTF8)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    Procedure.s CodepointToUtf8(codepoint.rl_int)
        Protected length.l
        Protected *charPointer = __CodePointToUtf8(codepoint, @length)
        If *charPointer And length
            ProcedureReturn PeekS(*charPointer, length, #PB_UTF8|#PB_ByteLength)
        EndIf
        ProcedureReturn ""
    EndProcedure
    
    ;
    ; Additional procedures
    ;
    Procedure InitVector2(*out.ray::Vector2, x.f = 0.0, y.f = 0.0)
        If *out : *out\x = x : *out\y = y : EndIf
    EndProcedure
    
    Procedure InitVector3(*out.ray::Vector3, x.f = 0.0, y.f = 0.0, z.f = 0.0)
        If *out : *out\x = x : *out\y = y : *out\z = z : EndIf
    EndProcedure
    
    Procedure InitVector4(*out.ray::Vector4, x.f = 0.0, y.f = 0.0, z.f = 0.0, w.f = 0.0)
        If *out : *out\x = x : *out\y = y : *out\z = z : *out\w = w : EndIf
    EndProcedure
    
    Procedure InitRectangle(*out.ray::Rectangle, x.f = 0.0, y.f = 0.0, width.f = 0.0, height.f = 0.0)
        If *out : *out\x = x : *out\y = y : *out\width = width : *out\height = height : EndIf
    EndProcedure

EndModule
;- ---------- Module End
;} ---------- Module End
DisableExplicit
