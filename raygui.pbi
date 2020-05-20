;********************************************************************************************
;*
;*   raygui v2.8 - A simple and easy-to-use immediate-mode gui library
;*
;*   DESCRIPTION:
;*
;*   raygui is a tools-dev-focused immediate-mode-gui library based on raylib but also
;*   available as a standalone library, as long as input and drawing functions are provided.
;*
;*   Controls provided:
;*
;*   # Container/separators Controls
;*       - WindowBox
;*       - GroupBox
;*       - Line
;*       - Panel
;*
;*   # Basic Controls
;*       - Label
;*       - Button
;*       - LabelButton   --> Label
;*       - ImageButton   --> Button
;*       - ImageButtonEx --> Button
;*       - Toggle
;*       - ToggleGroup   --> Toggle
;*       - CheckBox
;*       - ComboBox
;*       - DropdownBox
;*       - TextBox
;*       - TextBoxMulti
;*       - ValueBox      --> TextBox
;*       - Spinner       --> Button, ValueBox
;*       - Slider
;*       - SliderBar     --> Slider
;*       - ProgressBar
;*       - StatusBar
;*       - ScrollBar
;*       - ScrollPanel
;*       - DummyRec
;*       - Grid
;*
;*   # Advance Controls
;*       - ListView
;*       - ColorPicker   --> ColorPanel, ColorBarHue
;*       - MessageBox    --> Window, Label, Button
;*       - TextInputBox  --> Window, Label, TextBox, Button
;*
;*   It also provides a set of functions for styling the controls based on its properties (size, color).
;*
;*   CONFIGURATION:
;*
;*   #define RAYGUI_IMPLEMENTATION
;*       Generates the implementation of the library into the included file.
;*       If not defined, the library is in header only mode and can be included in other headers
;*       or source files without problems. But only ONE file should hold the implementation.
;*
;*   #define RAYGUI_STATIC (defined by default)
;*       The generated implementation will stay private inside implementation file and all
;*       internal symbols and functions will only be visible inside that file.
;*
;*   #define RAYGUI_STANDALONE
;*       Avoid raylib.h header inclusion in this file. Data types defined on raylib are defined
;*       internally in the library and input management and drawing functions must be provided by
;*       the user (check library implementation for further details).
;*
;*   #define RAYGUI_SUPPORT_ICONS
;*       Includes riconsdata.h header defining a set of 128 icons (binary format) to be used on
;*       multiple controls and following raygui styles
;*
;*
;*   VERSIONS HISTORY:
;*       2.8 (03-May-2020) Centralized rectangles drawing to GuiDrawRectangle()
;*       2.7 (20-Feb-2020) Added possible tooltips API
;*       2.6 (09-Sep-2019) ADDED: GuiTextInputBox()
;*                         REDESIGNED: GuiListView*(), GuiDropdownBox(), GuiSlider*(), GuiProgressBar(), GuiMessageBox()
;*                         REVIEWED: GuiTextBox(), GuiSpinner(), GuiValueBox(), GuiLoadStyle()
;*                         Replaced property INNER_PADDING by TEXT_PADDING, renamed some properties
;*                         Added 8 new custom styles ready to use
;*                         Multiple minor tweaks and bugs corrected
;*       2.5 (28-May-2019) Implemented extended GuiTextBox(), GuiValueBox(), GuiSpinner()
;*       2.3 (29-Apr-2019) Added rIcons auxiliar library and support for it, multiple controls reviewed
;*                         Refactor all controls drawing mechanism to use control state
;*       2.2 (05-Feb-2019) Added GuiScrollBar(), GuiScrollPanel(), reviewed GuiListView(), removed Gui*Ex() controls
;*       2.1 (26-Dec-2018) Redesign of GuiCheckBox(), GuiComboBox(), GuiDropdownBox(), GuiToggleGroup() > Use combined text string
;*                         Complete redesign of style system (breaking change)
;*       2.0 (08-Nov-2018) Support controls guiLock and custom fonts, reviewed GuiComboBox(), GuiListView()...
;*       1.9 (09-Oct-2018) Controls review: GuiGrid(), GuiTextBox(), GuiTextBoxMulti(), GuiValueBox()...
;*       1.8 (01-May-2018) Lot of rework and redesign to align with rGuiStyler and rGuiLayout
;*       1.5 (21-Jun-2017) Working in an improved styles system
;*       1.4 (15-Jun-2017) Rewritten all GUI functions (removed useless ones)
;*       1.3 (12-Jun-2017) Redesigned styles system
;*       1.1 (01-Jun-2017) Complete review of the library
;*       1.0 (07-Jun-2016) Converted to header-only by Ramon Santamaria.
;*       0.9 (07-Mar-2016) Reviewed and tested by Albert Martos, Ian Eito, Sergio Martinez and Ramon Santamaria.
;*       0.8 (27-Aug-2015) Initial release. Implemented by Kevin Gato, Daniel Nicolás and Ramon Santamaria.
;*
;*   CONTRIBUTORS:
;*       Ramon Santamaria:   Supervision, review, redesign, update and maintenance...
;*       Vlad Adrian:        Complete rewrite of GuiTextBox() to support extended features (2019)
;*       Sergio Martinez:    Review, testing (2015) and redesign of multiple controls (2018)
;*       Adria Arranz:       Testing and Implementation of additional controls (2018)
;*       Jordi Jorba:        Testing and Implementation of additional controls (2018)
;*       Albert Martos:      Review and testing of the library (2015)
;*       Ian Eito:           Review and testing of the library (2015)
;*       Kevin Gato:         Initial implementation of basic components (2014)
;*       Daniel Nicolas:     Initial implementation of basic components (2014)
;*
;*
;*   LICENSE: zlib/libpng
;*
;*   Copyright (c) 2014-2020 Ramon Santamaria (@raysan5)
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
;***********************************************************************************************
;*
;*   Translated to PureBasic by Danilo Krahn, May 2020
;*
;***********************************************************************************************
XIncludeFile "raylib.pbi"

EnableExplicit


;- -- DeclareModule Start
;{ -- DeclareModule Start
DeclareModule raygui
    UseModule ray
    ;>---------------------------------------------------------------------------------
    ; Defines and Macros
    ;>---------------------------------------------------------------------------------
    #RAYGUI_VERSION               = "2.8"

    #NUM_CONTROLS                 = 16  ; Number of standard controls
    #NUM_PROPS_DEFAULT            = 16  ; Number of standard properties
    #NUM_PROPS_EXTENDED           =  8  ; Number of extended properties

    #TEXTEDIT_CURSOR_BLINK_FRAMES = 20  ; Text edit controls cursor blink timming

    ; NOTE: This define is also used by GuiMessageBox() and GuiTextInputBox()
    #WINDOW_STATUSBAR_HEIGHT    = 22

    #PANEL_BORDER_WIDTH         =  1
    #ICON_TEXT_PADDING          =  4
    #GROUPBOX_LINE_THICK        =  1
    #GROUPBOX_TEXT_PADDING      = 10
    #LINE_TEXT_PADDING          = 10
    #TOGGLEGROUP_MAX_ELEMENTS   = 32


    Macro TEXT_VALIGN_PIXEL_OFFSET(h)
        (Int(h)%2)     ; Vertical alignment for pixel perfect
    EndMacro
    
    ;- ---- Enumerations Start
    ;{ ---- Enumerations Start
    ;>---------------------------------------------------------------------------------
    ; Enumerators Definition
    ;>---------------------------------------------------------------------------------

    ; Gui control property style color element
    Enumeration GuiPropertyElement
        #BORDER = 0
        #BASE
        #TEXT
        #OTHER
    EndEnumeration

    ; Gui control state
    Enumeration GuiControlState
        #GUI_STATE_NORMAL = 0
        #GUI_STATE_FOCUSED
        #GUI_STATE_PRESSED
        #GUI_STATE_DISABLED
    EndEnumeration

    ; Gui control text alignment
    Enumeration GuiTextAlignment
        #GUI_TEXT_ALIGN_LEFT = 0
        #GUI_TEXT_ALIGN_CENTER
        #GUI_TEXT_ALIGN_RIGHT
    EndEnumeration

    ; Gui controls
    Enumeration GuiControl
        #DEFAULT = 0
        #LABEL                          ; LABELBUTTON
        #BUTTON                         ; IMAGEBUTTON
        #TOGGLE                         ; TOGGLEGROUP
        #SLIDER                         ; SLIDERBAR
        #PROGRESSBAR
        #CHECKBOX
        #COMBOBOX
        #DROPDOWNBOX
        #TEXTBOX                        ; TEXTBOXMULTI
        #VALUEBOX
        #SPINNER
        #LISTVIEW
        #COLORPICKER
        #SCROLLBAR
        #STATUSBAR
    EndEnumeration

    ; Gui base properties for every control
    Enumeration GuiControlProperty
        #BORDER_COLOR_NORMAL = 0
        #BASE_COLOR_NORMAL
        #TEXT_COLOR_NORMAL
        #BORDER_COLOR_FOCUSED
        #BASE_COLOR_FOCUSED
        #TEXT_COLOR_FOCUSED
        #BORDER_COLOR_PRESSED
        #BASE_COLOR_PRESSED
        #TEXT_COLOR_PRESSED
        #BORDER_COLOR_DISABLED
        #BASE_COLOR_DISABLED
        #TEXT_COLOR_DISABLED
        #BORDER_WIDTH
        #TEXT_PADDING
        #TEXT_ALIGNMENT
        #RESERVED
    EndEnumeration

    ; Gui extended properties depend on control
    ; NOTE: We reserve a fixed size of additional properties per control

    ; DEFAULT properties
    Enumeration GuiDefaultProperty
        #TEXT_SIZE = 16
        #TEXT_SPACING
        #LINE_COLOR
        #BACKGROUND_COLOR
    EndEnumeration

    ; Label
    ;Enumeration GuiLabelProperty
    ;EndEnumeration

    ; Button
    ;Enumeration GuiButtonProperty
    ;EndEnumeration

    ; Toggle / ToggleGroup
    Enumeration GuiToggleProperty
        #GROUP_PADDING = 16
    EndEnumeration

    ; Slider / SliderBar
    Enumeration GuiSliderProperty
        #SLIDER_WIDTH = 16
        #SLIDER_PADDING
    EndEnumeration

    ; ProgressBar
    Enumeration GuiProgressBarProperty
        #PROGRESS_PADDING = 16
    EndEnumeration

    ; CheckBox
    Enumeration GuiCheckBoxProperty
        #CHECK_PADDING = 16
    EndEnumeration

    ; ComboBox
    Enumeration GuiComboBoxProperty
        #COMBO_BUTTON_WIDTH = 16
        #COMBO_BUTTON_PADDING
    EndEnumeration

    ; DropdownBox
    Enumeration GuiDropdownBoxProperty
        #ARROW_PADDING = 16
        #DROPDOWN_ITEMS_PADDING
    EndEnumeration

    ; TextBox / TextBoxMulti / ValueBox / Spinner
    Enumeration GuiTextBoxProperty
        #TEXT_INNER_PADDING = 16
        #TEXT_LINES_PADDING
        #COLOR_SELECTED_FG
        #COLOR_SELECTED_BG
    EndEnumeration

    ; Spinner
    Enumeration GuiSpinnerProperty
        #SPIN_BUTTON_WIDTH = 16
        #SPIN_BUTTON_PADDING
    EndEnumeration

    ; ScrollBar
    Enumeration GuiScrollBarProperty
        #ARROWS_SIZE = 16
        #ARROWS_VISIBLE
        #SCROLL_SLIDER_PADDING
        #SCROLL_SLIDER_SIZE
        #SCROLL_PADDING
        #SCROLL_SPEED
    EndEnumeration

    ; ScrollBar side
    Enumeration GuiScrollBarSide
        #SCROLLBAR_LEFT_SIDE = 0
        #SCROLLBAR_RIGHT_SIDE
    EndEnumeration

    ; ListView
    Enumeration GuiListViewProperty
        #LIST_ITEMS_HEIGHT = 16
        #LIST_ITEMS_PADDING
        #SCROLLBAR_WIDTH
        #SCROLLBAR_SIDE
    EndEnumeration

    ; ColorPicker
    Enumeration GuiColorPickerProperty
        #COLOR_SELECTOR_SIZE = 16
        #HUEBAR_WIDTH                   ; Right hue bar width
        #HUEBAR_PADDING                 ; Right hue bar separation from panel
        #HUEBAR_SELECTOR_HEIGHT         ; Right hue bar selector height
        #HUEBAR_SELECTOR_OVERFLOW       ; Right hue bar selector overflow
    EndEnumeration
    ;- ---- Enumerations End
    ;} ---- Enumerations End


    ;- ---- Structures Start
    ;{ ---- Structures Start
    ;>---------------------------------------------------------------------------------
    ; Structures Definition
    ;>---------------------------------------------------------------------------------
    ; Style property
    Structure GuiStyleProp
        controlId.u
        propertyId.u
        propertyValue.l
    EndStructure
    ;- ---- Structures End
    ;} ---- Structures End
    

    ;- ---- Function Declarations Start
    ;{ ---- Function Declarations Start
    ;>---------------------------------------------------------------------------------
    ; Function Declarations
    ;>---------------------------------------------------------------------------------
    ; State modification functions
    Declare   GuiEnable()                                       ; Enable gui controls (global state)
    Declare   GuiDisable()                                      ; Disable gui controls (global state)
    Declare   GuiLock()                                         ; Lock gui controls (global state)
    Declare   GuiUnlock()                                       ; Unlock gui controls (global state)
    Declare   GuiFade(alpha.f)                                  ; Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
    Declare   GuiSetState(state.i)                              ; Set gui state (global state)
    Declare.i GuiGetState()                                     ; Get gui state (global state)
    
    ; Font set/get functions
    Declare   GuiSetFont(*in_font.ray::Font)                    ; Set gui custom font (global state)
    Declare   GuiGetFont(*out_result.ray::Font)                 ; Get gui custom font (global state)
    
    ; Style set/get functions
    Declare   GuiSetStyle(control.u, property.u, value.l)       ; Set one style property
    Declare.l GuiGetStyle(control.u, property.u)                ; Get one style property
    
    ; Tooltips set functions
    Declare   GuiEnableTooltip()                                ; Enable gui tooltips
    Declare   GuiDisableTooltip()                               ; Disable gui tooltips
    Declare   GuiSetTooltip(tooltip.s)                          ; Set current tooltip for display
    Declare   GuiClearTooltip()                                 ; Clear any tooltip registered
    
    ; Container/separator controls, useful for controls organization
    Declare.i GuiWindowBox(*in_bounds.Rectangle, title.s)       ; Window Box control, shows a window that can be closed
    Declare   GuiGroupBox(*in_bounds.Rectangle, text.s)         ; Group Box control with text name
    Declare   GuiLine(*in_bounds.Rectangle, text.s)             ; Line separator control, could contain text
    Declare   GuiPanel(*in_bounds.Rectangle)                    ; Panel control, useful to group controls
    ;Declare Rectangle GuiScrollPanel(Rectangle bounds, Rectangle content, Vector2 *scroll)               ; Scroll Panel control
    
    ; Basic controls set
    Declare   GuiLabel(*in_bounds.Rectangle, text.s)            ; Label control, shows text
    Declare.i GuiButton(*in_bounds.Rectangle, text.s)           ; Button control, returns true when clicked
    Declare.i GuiLabelButton(*in_bounds.Rectangle, text.s)      ; Label button control, show true when clicked
    Declare.i GuiImageButton(*in_bounds.Rectangle, text.s,
                             *in_texture.Texture2D)             ; Image button control, returns true when clicked
    Declare.i GuiImageButtonEx(*in_bounds.Rectangle, text.s,
                               *in_texture.Texture2D,
                               *in_texSource.Rectangle)         ; Image button extended control, returns true when clicked
    Declare.i GuiToggle(*in_bounds.Rectangle, text.s, active.i) ; Toggle Button control, returns true when active
    Declare.i GuiToggleGroup(*in_bounds.Rectangle, text.s,
                             active.i)                          ; Toggle Group control, returns active toggle index
    Declare.i GuiCheckBox(*in_bounds.Rectangle, text.s,
                          checked.i)                            ; Check Box control, returns true when active
    ;Declare int GuiComboBox(Rectangle bounds, const char *text, int active)                              ; Combo Box control, returns selected item index
    ;Declare bool GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode)          ; Dropdown Box control, returns selected item
    ;Declare bool GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode)     ; Spinner control, returns selected value
    ;Declare bool GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode)    ; Value Box control, updates input text with numbers
    ;Declare bool GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode)                   ; Text Box control, updates input text
    ;Declare bool GuiTextBoxMulti(Rectangle bounds, char *text, int textSize, bool editMode)              ; Text Box control with multiple lines
    Declare.f GuiSlider(*in_bounds.Rectangle,
                        textLeft.s, textRight.s,
                        value.f, minValue.f, maxValue.f)        ; Slider control, returns selected value
    Declare.f GuiSliderBar(*in_bounds.Rectangle,
                           textLeft.s, textRight.s,
                           value.f, minValue.f, maxValue.f)     ; Slider Bar control, returns selected value
    Declare.f GuiProgressBar(*in_bounds.Rectangle,
                             textLeft.s, textRight.s,
                             value.f, minValue.f, maxValue.f)   ; Progress Bar control, shows current progress value
    Declare  GuiStatusBar(*in_bounds.Rectangle, text.s)         ; Status Bar control, shows info text
    ;Declare  GuiDummyRec(Rectangle bounds, const char *text)                                         ; Dummy control for placeholders
    ;Declare int GuiScrollBar(Rectangle bounds, int value, int minValue, int maxValue)                    ; Scroll Bar control
    ;Declare Vector2 GuiGrid(Rectangle bounds, float spacing, int subdivs)                                ; Grid control
    
    ; Advance controls set
    ;Declare int GuiListView(Rectangle bounds, const char *text, int *scrollIndex, int active)            ; List View control, returns selected list item index
    ;Declare int GuiListViewEx(Rectangle bounds, const char **text, int count, int *focus, int *scrollIndex, int active)      ; List View with extended parameters
    ;Declare int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons)                 ; Message Box control, displays a message
    ;Declare int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, const char *buttons, char *text)   ; Text Input Box control, ask for text
    ;Declare Color GuiColorPicker(Rectangle bounds, Color color)                                          ; Color Picker control (multiple color controls)
    ;Declare Color GuiColorPanel(Rectangle bounds, Color color)                                           ; Color Panel control
    ;Declare float GuiColorBarAlpha(Rectangle bounds, float alpha)                                        ; Color Bar Alpha control
    ;Declare float GuiColorBarHue(Rectangle bounds, float value)                                          ; Color Bar Hue control
    
    ; Styles loading functions
;   Declare   GuiLoadStyle(fileName.s)                          ; Load style file (.rgs)
    Declare   GuiLoadStyleDefault()                             ; Load style default over global style
    
    ;/*
    ;typedef GuiStyle (unsigned int *)
    ;Declare GuiStyle LoadGuiStyle(const char *fileName)         ; Load style from file (.rgs)
    ;Declare  UnloadGuiStyle(GuiStyle style)                     ; Unload style
    ;*/
    
    ;Declare const char *GuiIconText(int iconId, const char *text) ; Get text with icon id prepended (if supported)
    
    ; Gui icons functionality
;    Declare   GuiDrawIcon(iconId.i, *in_position.ray::Vector2, pixelSize.i, color.i)
;
;    Declare.i GuiGetIcons()                                     ; Get full icons data pointer
;    Declare.i GuiGetIconData(iconId.i)                          ; Get icon bit data
;    Declare   GuiSetIconData(iconId.i, *in_data)                ; Set icon bit data
;
;    Declare   GuiSetIconPixel(iconId.i, x.i, y.i)               ; Set icon pixel value
;    Declare   GuiClearIconPixel(iconId.i, x.i, y.i)             ; Clear icon pixel value
;    Declare.i GuiCheckIconPixel(iconId.i, x.i, y.i)             ; Check icon pixel value


    ;>---------------------------------------------------------------------------------
    ; Module specific Functions Declaration (internal)
    ;>---------------------------------------------------------------------------------
    Declare.i GetTextWidth(text.s)                                                  ; Gui get text width using default font
    Declare   GetTextBounds(*out_result.Rectangle, control, *in_bounds.Rectangle)   ; Get text bounds considering control bounds
    Declare.s GetTextIcon(text.s, *iconId.Integer)                                  ; Get text icon if provided and move text cursor

    Declare   GuiDrawText(text.s, *in_bounds.Rectangle, alignment, tint)            ; Gui draw text using default font
    Declare   GuiDrawRectangle(*in_rec.Rectangle, borderWidth, borderColor, color)  ; Gui draw rectangle using default raygui style
    Declare   GuiDrawTooltip(*in_bounds.Rectangle)                                  ; Draw tooltip relatively to bounds

    ;static const char **GuiTextSplit(const char *text, int *count, int *textRow);   // Split controls text into multiple strings
    ;static Vector3 ConvertHSVtoRGB(Vector3 hsv);                    // Convert color data from HSV to RGB
    ;static Vector3 ConvertRGBtoHSV(Vector3 rgb);                    // Convert color data from RGB to HSV




    ;- ---- Function Declarations End
    ;} ---- Function Declarations End

EndDeclareModule
;- -- DeclareModule End
;} -- DeclareModule End


;- -- Module Start
;{ -- Module Start
Module raygui
    EnableExplicit
    ;- ---- Global Variables Start
    ;{ ---- Global Variables Start
    ;>---------------------------------------------------------------------------------
    ; Global Variables Definition
    ;>---------------------------------------------------------------------------------
    Global guiState = #GUI_STATE_NORMAL     ; Enumeration GuiControlState

    Global guiFont.ray::Font               ; Gui current font (WARNING: highly coupled to raylib)
    Global guiLocked = #False               ; Gui lock state (no inputs processed)
    Global guiAlpha.f = 1.0                 ; Gui element transpacency on drawing

    ; Global gui style array (allocated on heap by default)
    ; NOTE: In raygui we manage a single int array with all the possible style properties.
    ; When a new style is loaded, it loads over the global style... but default gui style
    ; could always be recovered with GuiLoadStyleDefault()
    Global Dim guiStyle.i(#NUM_CONTROLS*(#NUM_PROPS_DEFAULT + #NUM_PROPS_EXTENDED))
    Global guiStyleLoaded = #False          ; Style loaded flag for lazy style initialization

    ; Tooltips required variables
    Global guiTooltip.s                     ; Gui tooltip currently active (user provided)
    Global guiTooltipEnabled = #True        ; Gui tooltips enabled
    ;- ---- Global Variables End
    ;} ---- Global Variables End
    
    ;>---------------------------------------------------------------------------------
    ; Gui Setup Functions Definition
    ;>---------------------------------------------------------------------------------
    ; Enable gui global state
    Procedure GuiEnable()
        guiState = #GUI_STATE_NORMAL
    EndProcedure

    ; Disable gui global state
    Procedure GuiDisable()
        guiState = #GUI_STATE_DISABLED
    EndProcedure

    ; Lock gui global state
    Procedure GuiLock()
        guiLocked = #True
    EndProcedure

    ; Unlock gui global state
    Procedure GuiUnlock()
        guiLocked = #False
    EndProcedure

    ; Set gui controls alpha global state
    Procedure GuiFade(alpha.f)
        If alpha < 0.0
            alpha = 0.0
        ElseIf alpha > 1.0
            alpha = 1.0
        EndIf

        guiAlpha = alpha
    EndProcedure

    ; Set gui state (global state)
    Procedure GuiSetState(state.i)
        guiState = state
    EndProcedure

    ; Get gui state (global state)
    Procedure.i GuiGetState()
        ProcedureReturn guiState
    EndProcedure

    ; Set custom gui font
    ; NOTE: Font loading/unloading is external to raygui
    Procedure GuiSetFont(*in_font.ray::Font)
        If *in_font And *in_font\texture\id > 0
            ; NOTE: If we try to setup a font but default style has not been
            ; lazily loaded before, it will be overwritten, so we need to force
            ; default style loading first
            If Not guiStyleLoaded
                GuiLoadStyleDefault()
            EndIf

            guiFont\baseSize   = *in_font\baseSize
            guiFont\charsCount = *in_font\charsCount
            guiFont\texture    = *in_font\texture
            guiFont\recs       = *in_font\recs  ; TODO: need to copy?
            guiFont\chars      = *in_font\chars ; TODO: need to copy?
            GuiSetStyle(#DEFAULT, #TEXT_SIZE, *in_font\baseSize)
        EndIf
    EndProcedure

    ; Get custom gui font
    Procedure GuiGetFont(*out_result.ray::Font)
        If Not *out_result : ProcedureReturn : EndIf
        
        If *out_result
            *out_result\baseSize   = guiFont\baseSize
            *out_result\charsCount = guiFont\charsCount
            *out_result\texture    = guiFont\texture
            *out_result\recs       = guiFont\recs  ; TODO: need to copy?
            *out_result\chars      = guiFont\chars ; TODO: need to copy?
        EndIf
    EndProcedure

    ; Set control style property value
    Procedure GuiSetStyle(control.u, property.u, value.l)
        If Not guiStyleLoaded
            GuiLoadStyleDefault()
        EndIf
        
        guiStyle(control*(#NUM_PROPS_DEFAULT + #NUM_PROPS_EXTENDED) + property) = value

        ; Default properties are propagated to all controls
        If control = 0 And property < #NUM_PROPS_DEFAULT
            Define i
            For i = 1 To #NUM_CONTROLS-1
                guiStyle(i*(#NUM_PROPS_DEFAULT + #NUM_PROPS_EXTENDED) + property) = value
            Next
        EndIf
    EndProcedure

    ; Get control style property value
    Procedure.l GuiGetStyle(control.u, property.u)
        If Not guiStyleLoaded
            GuiLoadStyleDefault()
        EndIf
        ProcedureReturn guiStyle(control*(#NUM_PROPS_DEFAULT + #NUM_PROPS_EXTENDED) + property)
    EndProcedure

    ; Enable gui tooltips
    Procedure GuiEnableTooltip()
        guiTooltipEnabled = #True
    EndProcedure

    ; Disable gui tooltips
    Procedure GuiDisableTooltip()
        guiTooltipEnabled = #False
    EndProcedure

    ; Set current tooltip for display
    Procedure GuiSetTooltip(tooltip.s)
        guiTooltip = tooltip
    EndProcedure
    
    ; Clear any tooltip registered
    Procedure GuiClearTooltip()
        guiTooltip = #Null$
    EndProcedure
    
    ;>---------------------------------------------------------------------------------
    ; Gui Controls Functions Definition
    ;>---------------------------------------------------------------------------------

    ; Window Box control
    Procedure GuiWindowBox(*in_bounds.Rectangle, title.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        ;Protected state = guiState
        Protected clicked = #False

        Protected statusBarHeight = #WINDOW_STATUSBAR_HEIGHT + 2*GuiGetStyle(#STATUSBAR, #BORDER_WIDTH)
        statusBarHeight + (statusBarHeight%2)

        Protected statusBar.Rectangle
        InitRectangle( @statusBar, *in_bounds\x, *in_bounds\y, *in_bounds\width, statusBarHeight )

        Protected height = *in_bounds\height
        If height < statusBarHeight*2
            height = statusBarHeight*2
        EndIf

        Protected windowPanel.Rectangle
        InitRectangle( @windowPanel, *in_bounds\x, *in_bounds\y + statusBarHeight - 1, *in_bounds\width, height - statusBarHeight )
        Protected closeButtonRec.ray::Rectangle
        InitRectangle( @closeButtonRec, statusBar\x + statusBar\width - GuiGetStyle(#STATUSBAR, #BORDER_WIDTH) - 20,
                                        statusBar\y + statusBarHeight/2 - 18/2, 18, 18 )

        ; Update control
        ;>-------------------------------------------------------------------
        ; NOTE: Logic is directly managed by button
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiStatusBar(@statusBar, title) ; Draw window header as status bar
        GuiPanel(@windowPanel)          ; Draw window base

        ; Draw window close button
        Protected tempBorderWidth = GuiGetStyle(#BUTTON, #BORDER_WIDTH)
        Protected tempTextAlignment = GuiGetStyle(#BUTTON, #TEXT_ALIGNMENT)
        GuiSetStyle(#BUTTON, #BORDER_WIDTH, 1)
        GuiSetStyle(#BUTTON, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_CENTER)
    ;#if defined(RAYGUI_SUPPORT_ICONS)
        ;clicked = GuiButton(closeButtonRec, GuiIconText(RICON_CROSS_SMALL, NULL));
    ;#else
        clicked = GuiButton(closeButtonRec, "x");
    ;#endif
        GuiSetStyle(#BUTTON, #BORDER_WIDTH, tempBorderWidth)
        GuiSetStyle(#BUTTON, #TEXT_ALIGNMENT, tempTextAlignment)
        ;>-------------------------------------------------------------------

        ProcedureReturn clicked
    EndProcedure


    ; Group Box control with text name
    Procedure GuiGroupBox(*in_bounds.Rectangle, text.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        Protected state = guiState
        Protected rect.Rectangle
        Protected color

        If state = #GUI_STATE_DISABLED
            color = #BORDER_COLOR_DISABLED
        Else
            color = #LINE_COLOR
        EndIf

        ; Draw control
        ;>-------------------------------------------------------------------
        InitRectangle(@rect, *in_bounds\x, *in_bounds\y, #GROUPBOX_LINE_THICK, *in_bounds\height)
        GuiDrawRectangle(@rect, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#DEFAULT, color)), guiAlpha))
        InitRectangle(@rect, *in_bounds\x, *in_bounds\y + *in_bounds\height - 1, *in_bounds\width, #GROUPBOX_LINE_THICK)
        GuiDrawRectangle(@rect, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#DEFAULT, color)), guiAlpha))
        InitRectangle(@rect, *in_bounds\x + *in_bounds\width - 1, *in_bounds\y, #GROUPBOX_LINE_THICK, *in_bounds\height )
        GuiDrawRectangle(@rect, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#DEFAULT, color)), guiAlpha))

        InitRectangle(@rect, *in_bounds\x, *in_bounds\y, *in_bounds\width, 1 )
        GuiLine(@rect, text)
        ;>-------------------------------------------------------------------
    EndProcedure


    ; Line control
    Procedure GuiLine(*in_bounds.Rectangle, text.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        Protected state = guiState
        Protected rect.Rectangle
        Protected col
        If state = #GUI_STATE_DISABLED
            col = #BORDER_COLOR_DISABLED
        Else
            col = #LINE_COLOR
        EndIf

        Protected color = Fade(GetColor(GuiGetStyle(#DEFAULT, col)), guiAlpha)

        ; Draw control
        ;>-------------------------------------------------------------------
        If text = ""
            InitRectangle(@rect, *in_bounds\x, *in_bounds\y + *in_bounds\height/2, *in_bounds\width, 1)
            GuiDrawRectangle(@rect, 0, #COLOR_BLANK, color)
        Else
            Protected textBounds.Rectangle
            textBounds\width  = GetTextWidth(text)  ; TODO: Consider text icon
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x + #LINE_TEXT_PADDING
            textBounds\y = *in_bounds\y - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2

            ; Draw line with embedded text label: "--- text --------------"
            InitRectangle(@rect, *in_bounds\x, *in_bounds\y, #LINE_TEXT_PADDING - 2, 1)
            GuiDrawRectangle(@rect, 0, #COLOR_BLANK, color)
            GuiLabel(@textBounds, text)
            InitRectangle(@rect, *in_bounds\x + #LINE_TEXT_PADDING + textBounds\width + 4, *in_bounds\y, *in_bounds\width - textBounds\width - #LINE_TEXT_PADDING - 4, 1)
            GuiDrawRectangle(@rect, 0, #COLOR_BLANK, color)
        EndIf
        ;>-------------------------------------------------------------------
    EndProcedure


    ; Panel control
    Procedure GuiPanel(*in_bounds.Rectangle)
        If Not *in_bounds : ProcedureReturn : EndIf
        
        Protected state = guiState
        Protected color1, color2

        If state = #GUI_STATE_DISABLED
            color1 = #BORDER_COLOR_DISABLED
            color2 = #BASE_COLOR_DISABLED
        Else
            color1 = #LINE_COLOR
            color2 = #BACKGROUND_COLOR
        EndIf

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, #PANEL_BORDER_WIDTH, Fade(GetColor(GuiGetStyle(#DEFAULT, color1)), guiAlpha),
                                                          Fade(GetColor(GuiGetStyle(#DEFAULT, color2)), guiAlpha))
        ;>-------------------------------------------------------------------
    EndProcedure
    
    
    ; Label control
    Procedure GuiLabel(*in_bounds.Rectangle, text.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        Protected state = guiState
        Protected color1, textBounds.Rectangle

        If state = #GUI_STATE_DISABLED
            color1 = #TEXT_COLOR_DISABLED
        Else
            color1 = #TEXT_COLOR_NORMAL
        EndIf

        GetTextBounds(@textBounds, #LABEL, *in_bounds)

        ; Update control
        ;>-------------------------------------------------------------------
        ; ...
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawText(text, @textBounds, GuiGetStyle(#LABEL, #TEXT_ALIGNMENT),
                                       Fade(GetColor(GuiGetStyle(#LABEL, color1)), guiAlpha))
        ;>-------------------------------------------------------------------
    EndProcedure

    ; Button control, returns true when clicked
    Procedure.i GuiButton(*in_bounds.Rectangle, text.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        Protected state = guiState
        Protected pressed = #False
        Protected textBounds.Rectangle

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            ; Check button state
            If CheckCollisionPointRec(@mousePoint, *in_bounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf

                If IsMouseButtonReleased(#MOUSE_LEFT_BUTTON)
                    pressed = #True
                EndIf
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#BUTTON, #BORDER_WIDTH),
                                     Fade(GetColor(GuiGetStyle(#BUTTON, #BORDER + (state*3))), guiAlpha),
                                     Fade(GetColor(GuiGetStyle(#BUTTON, #BASE   + (state*3))), guiAlpha))
        GetTextBounds(@textBounds, #BUTTON, *in_bounds)
        GuiDrawText(text, @textBounds, GuiGetStyle(#BUTTON, #TEXT_ALIGNMENT),
                    Fade(GetColor(GuiGetStyle(#BUTTON, #TEXT + (state*3))), guiAlpha))
        ;>-------------------------------------------------------------------

        ProcedureReturn pressed
    EndProcedure
    

    ; Label button control
    Procedure.i GuiLabelButton(*in_bounds.Rectangle, text.s)
        Protected state   = guiState
        Protected pressed = #False
        Protected bounds.Rectangle, finalRect.Rectangle

        InitRectangle(@bounds, *in_bounds\x, *in_bounds\y, *in_bounds\width, *in_bounds\height)

        ; NOTE: We force *in_bounds\width to be all text
        Protected textSize.Vector2
        MeasureTextEx(@textSize, @guiFont, text, GuiGetStyle(#DEFAULT, #TEXT_SIZE), GuiGetStyle(#DEFAULT, #TEXT_SPACING))
        Protected textWidth = textSize\x
        If bounds\width < textWidth
            bounds\width = textWidth
        EndIf

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            ; Check checkbox state
            If CheckCollisionPointRec(@mousePoint, @bounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf

                If IsMouseButtonReleased(#MOUSE_LEFT_BUTTON)
                    pressed = #True
                EndIf
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GetTextBounds(@finalRect, #LABEL, @bounds)
        GuiDrawText(text, @finalRect, GuiGetStyle(#LABEL, #TEXT_ALIGNMENT), Fade(GetColor(GuiGetStyle(#LABEL, #TEXT + (state*3))), guiAlpha))
        ;>-------------------------------------------------------------------

        ProcedureReturn pressed
    EndProcedure


    ;// Image button control, returns true when clicked
    Procedure.i GuiImageButton(*in_bounds.Rectangle, text.s, *in_texture.Texture2D)
        If Not *in_bounds Or Not *in_texture
            ProcedureReturn #False
        EndIf
        Protected rect.Rectangle
        InitRectangle(@rect, 0, 0, *in_texture\width, *in_texture\height)
        ProcedureReturn GuiImageButtonEx(*in_bounds, text, *in_texture, @rect)
    EndProcedure

    ;// Image button control, returns true when clicked
    Procedure.i GuiImageButtonEx(*in_bounds.Rectangle, text.s, *in_texture.Texture2D, *in_texSource.Rectangle)
        If Not *in_bounds Or Not *in_texture Or Not *in_texSource
            ProcedureReturn #False
        EndIf

        Protected state = guiState
        Protected clicked = #False

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            ; Check button state
            If CheckCollisionPointRec(@mousePoint, *in_bounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED
                ElseIf IsMouseButtonReleased(#MOUSE_LEFT_BUTTON)
                    clicked = #True
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#BUTTON, #BORDER_WIDTH),
                         Fade(GetColor(GuiGetStyle(#BUTTON, #BORDER + (state*3))), guiAlpha),
                         Fade(GetColor(GuiGetStyle(#BUTTON, #BASE   + (state*3))), guiAlpha))

        If text <> ""
            Protected rect.Rectangle
            GetTextBounds(@rect, #BUTTON, *in_bounds)
            GuiDrawText(text, @rect, GuiGetStyle(#BUTTON, #TEXT_ALIGNMENT),
                        Fade(GetColor(GuiGetStyle(#BUTTON, #TEXT + (state*3))), guiAlpha))
        EndIf
        If *in_texture\id > 0
            Protected vec.Vector2
            InitVector2(@vec, *in_bounds\x + *in_bounds\width/2 - *in_texSource\width/2, *in_bounds\y + *in_bounds\height/2 - *in_texSource\height/2)
            DrawTextureRec(*in_texture, *in_texSource, @vec, Fade(GetColor(GuiGetStyle(#BUTTON, #TEXT + (state*3))), guiAlpha))
        EndIf
        ;>-------------------------------------------------------------------

        ProcedureReturn clicked
    EndProcedure


    ; Toggle Button control, returns true when active
    Procedure.i GuiToggle(*in_bounds.Rectangle, text.s, active.i)
        If Not *in_bounds : ProcedureReturn #False : EndIf

        Protected state = guiState
        Protected rect.Rectangle

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            ; Check toggle button state
            If CheckCollisionPointRec(@mousePoint, *in_bounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED
                ElseIf IsMouseButtonReleased(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_NORMAL
                    active ! 1
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        If state = #GUI_STATE_NORMAL
            Protected color1, color2, color3
            If active
                color1 = #BORDER_COLOR_PRESSED
                color2 = #BASE_COLOR_PRESSED
                color3 = #TEXT_COLOR_PRESSED
            Else
                color1 = #BORDER + state*3
                color2 = #BASE   + state*3
                color3 = #TEXT   + state*3
            EndIf
            GuiDrawRectangle(*in_bounds, GuiGetStyle(#TOGGLE, #BORDER_WIDTH),
                             Fade(GetColor(GuiGetStyle(#TOGGLE, color1)), guiAlpha), Fade(GetColor(GuiGetStyle(#TOGGLE, color2)), guiAlpha))
            GetTextBounds(@rect, #TOGGLE, *in_bounds)
            GuiDrawText(text, @rect, GuiGetStyle(#TOGGLE, #TEXT_ALIGNMENT),
                        Fade(GetColor(GuiGetStyle(#TOGGLE, color3)), guiAlpha))
        Else
            GuiDrawRectangle(*in_bounds, GuiGetStyle(#TOGGLE, #BORDER_WIDTH),
                             Fade(GetColor(GuiGetStyle(#TOGGLE, #BORDER + state*3)), guiAlpha),
                             Fade(GetColor(GuiGetStyle(#TOGGLE, #BASE   + state*3)), guiAlpha))
            GetTextBounds(@rect, #TOGGLE, *in_bounds)
            GuiDrawText(text, @rect, GuiGetStyle(#TOGGLE, #TEXT_ALIGNMENT),
                        Fade(GetColor(GuiGetStyle(#TOGGLE, #TEXT + state*3)), guiAlpha))
        EndIf
        ;>-------------------------------------------------------------------

        ProcedureReturn active
    EndProcedure


    ; Toggle Group control, returns toggled button index
    Procedure.i GuiToggleGroup(*in_bounds.Rectangle, text.s, active.i)
        If Not *in_bounds Or text="" : ProcedureReturn #False : EndIf
        
        Protected currentBounds.Rectangle
        InitRectangle(@currentBounds, *in_bounds\x, *in_bounds\y, *in_bounds\width, *in_bounds\height)
        Protected currentElement = 1
        Protected currentText.s
        Protected *charPointer.Character = @text
        
        Repeat
            Select *charPointer\c
                Case 0, 10
                    If currentElement = active
                        GuiToggle(@currentBounds, currentText, #True)
                    ElseIf GuiToggle(@currentBounds, currentText, #False) = #True
                        active = currentElement
                    EndIf
                    currentText = "" : currentElement + 1
                    currentBounds\x + (*in_bounds\width + GuiGetStyle(#TOGGLE, #GROUP_PADDING))
                    If *charPointer\c = 0
                        Break
                    EndIf
                Case 13
                    If currentElement = active
                        GuiToggle(@currentBounds, currentText, #True)
                    ElseIf GuiToggle(@currentBounds, currentText, #False) = #True
                        active = currentElement
                    EndIf
                    currentText = "" : currentElement + 1
                    currentBounds\x = *in_bounds\x
                    currentBounds\y + *in_bounds\height + GuiGetStyle(#TOGGLE, #GROUP_PADDING)
                Default
                    currentText + Chr(*charPointer\c)
            EndSelect
            *charPointer + SizeOf(Character)
        ForEver

        ProcedureReturn active
    EndProcedure


    ; Check Box control, returns true when active
    Procedure.i GuiCheckBox(*in_bounds.Rectangle, text.s, checked.i)
        If Not *in_bounds : ProcedureReturn #False : EndIf

        Protected state = guiState

        Protected textBounds.Rectangle

        If text
            textBounds\width = GetTextWidth(text)
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x + *in_bounds\width + GuiGetStyle(#CHECKBOX, #TEXT_PADDING)
            textBounds\y = *in_bounds\y + *in_bounds\height/2 - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2
            If GuiGetStyle(#CHECKBOX, #TEXT_ALIGNMENT) = #GUI_TEXT_ALIGN_LEFT
                textBounds\x = *in_bounds\x - textBounds\width - GuiGetStyle(#CHECKBOX, #TEXT_PADDING)
            EndIf
        EndIf

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            Protected totalBounds.Rectangle
            InitRectangle(@totalBounds, 0, *in_bounds\y,
                          *in_bounds\width + textBounds\width + GuiGetStyle(#CHECKBOX, #TEXT_PADDING),
                          *in_bounds\height)
            If GuiGetStyle(#CHECKBOX, #TEXT_ALIGNMENT) = #GUI_TEXT_ALIGN_LEFT
                totalBounds\x = textBounds\x
            Else
                totalBounds\x = *in_bounds\x
            EndIf

            ; Check checkbox state
            If CheckCollisionPointRec(@mousePoint, @totalBounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf

                If IsMouseButtonReleased(#MOUSE_LEFT_BUTTON)
                    checked ! 1
                EndIf
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#CHECKBOX, #BORDER_WIDTH),
                         Fade(GetColor(GuiGetStyle(#CHECKBOX, #BORDER + (state*3))), guiAlpha), #COLOR_BLANK)

        If checked
            Protected check.Rectangle
            InitRectangle(@check,
                          *in_bounds\x + GuiGetStyle(#CHECKBOX, #BORDER_WIDTH) + GuiGetStyle(#CHECKBOX, #CHECK_PADDING),
                          *in_bounds\y + GuiGetStyle(#CHECKBOX, #BORDER_WIDTH) + GuiGetStyle(#CHECKBOX, #CHECK_PADDING),
                          *in_bounds\width  - 2*(GuiGetStyle(#CHECKBOX, #BORDER_WIDTH) + GuiGetStyle(#CHECKBOX, #CHECK_PADDING)),
                          *in_bounds\height - 2*(GuiGetStyle(#CHECKBOX, #BORDER_WIDTH) + GuiGetStyle(#CHECKBOX, #CHECK_PADDING)) )
            GuiDrawRectangle(@check, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#CHECKBOX, #TEXT + state*3)), guiAlpha))
        EndIf

        If text
            Protected _align
            If GuiGetStyle(#CHECKBOX, #TEXT_ALIGNMENT) = #GUI_TEXT_ALIGN_RIGHT
                _align = #GUI_TEXT_ALIGN_LEFT
            Else
                _align = #GUI_TEXT_ALIGN_RIGHT
            EndIf
            GuiDrawText(text, @textBounds, _align, Fade(GetColor(GuiGetStyle(#LABEL, #TEXT + (state*3))), guiAlpha))
        EndIf
        ;>-------------------------------------------------------------------

        ProcedureReturn checked
    EndProcedure


    ; Slider control with pro parameters
    ; NOTE: Other GuiSlider*() controls use this one
    Procedure.f GuiSliderPro(*in_bounds.Rectangle, textLeft.s, textRight.s, value.f, minValue.f, maxValue.f, sliderWidth.i)
        If Not *in_bounds : ProcedureReturn 0.0 : EndIf

        Protected state = guiState
        Protected sliderValue = (((value - minValue)/(maxValue - minValue))*(*in_bounds\width - 2*GuiGetStyle(#SLIDER, #BORDER_WIDTH)))

        Protected slider.Rectangle
        InitRectangle(@slider, *in_bounds\x, *in_bounds\y + GuiGetStyle(#SLIDER, #BORDER_WIDTH) + GuiGetStyle(#SLIDER, #SLIDER_PADDING),
                               0, *in_bounds\height - 2*GuiGetStyle(#SLIDER, #BORDER_WIDTH) - 2*GuiGetStyle(#SLIDER, #SLIDER_PADDING) )

        If sliderWidth > 0      ; Slider
            slider\x + (sliderValue - sliderWidth/2)
            slider\width = sliderWidth
        ElseIf sliderWidth = 0  ; SliderBar
            slider\x + GuiGetStyle(#SLIDER, #BORDER_WIDTH)
            slider\width = sliderValue
        EndIf

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED And Not guiLocked
            Protected mousePoint.Vector2
            GetMousePosition(@mousePoint)

            If CheckCollisionPointRec(@mousePoint, *in_bounds)
                If IsMouseButtonDown(#MOUSE_LEFT_BUTTON)
                    state = #GUI_STATE_PRESSED

                    ; Get equivalent value and slider position from mousePoint.x
                    value = ((maxValue - minValue)*(mousePoint\x - (*in_bounds\x + sliderWidth/2)))/(*in_bounds\width - sliderWidth) + minValue

                    If sliderWidth > 0
                        slider\x = mousePoint\x - slider\width/2    ; Slider
                    ElseIf sliderWidth = 0
                        slider\width = sliderValue                  ; SliderBar
                    EndIf
                Else
                    state = #GUI_STATE_FOCUSED
                EndIf
            EndIf

            If value > maxValue
                value = maxValue
            ElseIf value < minValue
                value = minValue
            EndIf
        EndIf

        ; Bar limits check
        If sliderWidth > 0          ; Slider
            If slider\x <= (*in_bounds\x + GuiGetStyle(#SLIDER, #BORDER_WIDTH))
                slider\x = *in_bounds\x + GuiGetStyle(#SLIDER, #BORDER_WIDTH)
            ElseIf (slider\x + slider\width) >= (*in_bounds\x + *in_bounds\width)
                slider\x = *in_bounds\x + *in_bounds\width - slider\width - GuiGetStyle(#SLIDER, #BORDER_WIDTH)
            EndIf
        ElseIf sliderWidth = 0      ; SliderBar
            If slider\width > *in_bounds\width
                slider\width = *in_bounds\width - 2*GuiGetStyle(#SLIDER, #BORDER_WIDTH)
            EndIf
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        Protected colorState
        If state <> #GUI_STATE_DISABLED
            colorState = #BASE_COLOR_NORMAL
        Else
            colorState = #BASE_COLOR_DISABLED
        EndIf
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#SLIDER, #BORDER_WIDTH),
                         Fade(GetColor(GuiGetStyle(#SLIDER, #BORDER + (state*3))), guiAlpha),
                         Fade(GetColor(GuiGetStyle(SLIDER, colorState)), guiAlpha))

        ; Draw slider internal bar (depends on state)
        If state = #GUI_STATE_NORMAL Or state = #GUI_STATE_PRESSED
            GuiDrawRectangle(@slider, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#SLIDER, #BASE_COLOR_PRESSED)), guiAlpha))
        ElseIf state = #GUI_STATE_FOCUSED
            GuiDrawRectangle(@slider, 0, #COLOR_BLANK, Fade(GetColor(GuiGetStyle(#SLIDER, #TEXT_COLOR_FOCUSED)), guiAlpha))
        EndIf

        Protected textBounds.Rectangle

        ; Draw left/right text if provided
        If textLeft
            textBounds\width  = GetTextWidth(textLeft)              ; TODO: Consider text icon
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x - textBounds\width - GuiGetStyle(#SLIDER, #TEXT_PADDING)
            textBounds\y = *in_bounds\y + *in_bounds\height/2 - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2

            GuiDrawText(textLeft, @textBounds, #GUI_TEXT_ALIGN_RIGHT,
                        Fade(GetColor(GuiGetStyle(#SLIDER, #TEXT + (state*3))), guiAlpha))
        EndIf

        If textRight
            textBounds\width  = GetTextWidth(textRight)             ; TODO: Consider text icon
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x + *in_bounds\width + GuiGetStyle(#SLIDER, #TEXT_PADDING)
            textBounds\y = *in_bounds\y + *in_bounds\height/2 - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2

            GuiDrawText(textRight, @textBounds, #GUI_TEXT_ALIGN_LEFT,
                        Fade(GetColor(GuiGetStyle(#SLIDER, #TEXT + (state*3))), guiAlpha))
        EndIf
        ;>-------------------------------------------------------------------

        ProcedureReturn value
    EndProcedure

    ; Slider control extended, returns selected value and has text
    Procedure.f GuiSlider(*in_bounds.Rectangle, textLeft.s, textRight.s, value.f, minValue.f, maxValue.f)
        ProcedureReturn GuiSliderPro(*in_bounds, textLeft, textRight, value, minValue, maxValue, GuiGetStyle(#SLIDER, #SLIDER_WIDTH))
    EndProcedure

    ; Slider Bar control extended, returns selected value
    Procedure.f GuiSliderBar(*in_bounds.Rectangle, textLeft.s, textRight.s, value.f, minValue.f, maxValue.f)
        ProcedureReturn GuiSliderPro(*in_bounds, textLeft, textRight, value, minValue, maxValue, 0)
    EndProcedure


    ; Progress Bar control extended, shows current progress value
    Procedure.f GuiProgressBar(*in_bounds.Rectangle, textLeft.s, textRight.s, value.f, minValue.f, maxValue.f)
        Protected state = guiState

        Protected progress.Rectangle
        InitRectangle(@progress,
                      *in_bounds\x + GuiGetStyle(#PROGRESSBAR, #BORDER_WIDTH),
                      *in_bounds\y + GuiGetStyle(#PROGRESSBAR, #BORDER_WIDTH) + GuiGetStyle(#PROGRESSBAR, #PROGRESS_PADDING),
                      0,
                      *in_bounds\height - 2*GuiGetStyle(#PROGRESSBAR, #BORDER_WIDTH) - 2*GuiGetStyle(#PROGRESSBAR, #PROGRESS_PADDING) )

        ; Update control
        ;>-------------------------------------------------------------------
        If state <> #GUI_STATE_DISABLED
            progress\width = (value/(maxValue - minValue)*(*in_bounds\width - 2*GuiGetStyle(#PROGRESSBAR, #BORDER_WIDTH)))
        EndIf
        ;>-------------------------------------------------------------------

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#PROGRESSBAR, #BORDER_WIDTH),
                         Fade(GetColor(GuiGetStyle(#PROGRESSBAR, #BORDER + (state*3))), guiAlpha), #COLOR_BLANK)

        ; Draw slider internal progress bar (depends on state)
        If state = #GUI_STATE_NORMAL Or state = #GUI_STATE_PRESSED
            GuiDrawRectangle(@progress, 0, #COLOR_BLANK,
                             Fade(GetColor(GuiGetStyle(#PROGRESSBAR, #BASE_COLOR_PRESSED)), guiAlpha))
        ElseIf state = #GUI_STATE_FOCUSED
            GuiDrawRectangle(@progress, 0, #COLOR_BLANK,
                             Fade(GetColor(GuiGetStyle(#PROGRESSBAR, #TEXT_COLOR_FOCUSED)), guiAlpha))
        EndIf

        Protected textBounds.Rectangle

        ; Draw left/right text if provided
        If textLeft
            textBounds\width  = GetTextWidth(textLeft)              ; TODO: Consider text icon
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x - textBounds\width - GuiGetStyle(#PROGRESSBAR, #TEXT_PADDING)
            textBounds\y = *in_bounds\y + *in_bounds\height/2 - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2

            GuiDrawText(textLeft, @textBounds, #GUI_TEXT_ALIGN_RIGHT,
                        Fade(GetColor(GuiGetStyle(#PROGRESSBAR, #TEXT + (state*3))), guiAlpha))
        endif

        if textRight
            textBounds\width  = GetTextWidth(textRight)             ; TODO: Consider text icon
            textBounds\height = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            textBounds\x = *in_bounds\x + *in_bounds\width + GuiGetStyle(#PROGRESSBAR, #TEXT_PADDING)
            textBounds\y = *in_bounds\y + *in_bounds\height/2 - GuiGetStyle(#DEFAULT, #TEXT_SIZE)/2

            GuiDrawText(textRight, @textBounds, #GUI_TEXT_ALIGN_LEFT,
                        Fade(GetColor(GuiGetStyle(#PROGRESSBAR, #TEXT + (state*3))), guiAlpha))
        endif
        ;>-------------------------------------------------------------------

        procedurereturn value
    endprocedure


    ; Status Bar control
    Procedure GuiStatusBar(*in_bounds.Rectangle, text.s)
        If Not *in_bounds : ProcedureReturn : EndIf

        Protected state = guiState
        Protected rect.Rectangle
        Protected color1, color2, color3

        If state <> #GUI_STATE_DISABLED
            color1 = #BORDER_COLOR_NORMAL
            color2 = #BASE_COLOR_NORMAL
            color3 = #TEXT_COLOR_NORMAL
        Else
            color1 = #BORDER_COLOR_DISABLED
            color2 = #BASE_COLOR_DISABLED
            color3 = #TEXT_COLOR_DISABLED
        EndIf

        ; Draw control
        ;>-------------------------------------------------------------------
        GuiDrawRectangle(*in_bounds, GuiGetStyle(#STATUSBAR, #BORDER_WIDTH),
                                     Fade(GetColor(GuiGetStyle(#STATUSBAR, color1)), guiAlpha),
                                     Fade(GetColor(GuiGetStyle(#STATUSBAR, color2)), guiAlpha))

        GetTextBounds(@rect, #STATUSBAR, *in_bounds)
        GuiDrawText(text, @rect, GuiGetStyle(#STATUSBAR, #TEXT_ALIGNMENT), Fade(GetColor(GuiGetStyle(#STATUSBAR, color3)), guiAlpha))
        ;>-------------------------------------------------------------------
    EndProcedure


    ;>---------------------------------------------------------------------------------
    ; Styles loading functions
    ;>---------------------------------------------------------------------------------    
    ;Procedure GuiLoadStyle(fileName.s)
    ;EndProcedure
    
    Procedure GuiLoadStyleDefault()
            ; We set this variable first to avoid cyclic function calls
            ; when calling GuiSetStyle() and GuiGetStyle()
            guiStyleLoaded = #True

            ; Initialize default LIGHT style property values
            GuiSetStyle(#DEFAULT, #BORDER_COLOR_NORMAL, $838383ff)
            GuiSetStyle(#DEFAULT, #BASE_COLOR_NORMAL, $c9c9c9ff)
            GuiSetStyle(#DEFAULT, #TEXT_COLOR_NORMAL, $686868ff)
            GuiSetStyle(#DEFAULT, #BORDER_COLOR_FOCUSED, $5bb2d9ff)
            GuiSetStyle(#DEFAULT, #BASE_COLOR_FOCUSED, $c9effeff)
            GuiSetStyle(#DEFAULT, #TEXT_COLOR_FOCUSED, $6c9bbcff)
            GuiSetStyle(#DEFAULT, #BORDER_COLOR_PRESSED, $0492c7ff)
            GuiSetStyle(#DEFAULT, #BASE_COLOR_PRESSED, $97e8ffff)
            GuiSetStyle(#DEFAULT, #TEXT_COLOR_PRESSED, $368bafff)
            GuiSetStyle(#DEFAULT, #BORDER_COLOR_DISABLED, $b5c1c2ff)
            GuiSetStyle(#DEFAULT, #BASE_COLOR_DISABLED, $e6e9e9ff)
            GuiSetStyle(#DEFAULT, #TEXT_COLOR_DISABLED, $aeb7b8ff)
            GuiSetStyle(#DEFAULT, #BORDER_WIDTH, 1)                         ; WARNING: Some controls use other values
            GuiSetStyle(#DEFAULT, #TEXT_PADDING, 0)                         ; WARNING: Some controls use other values
            GuiSetStyle(#DEFAULT, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_CENTER)  ; WARNING: Some controls use other values

            ; Initialize control-specific property values
            ; NOTE: Those properties are in default list but require specific values by control type
            GuiSetStyle(#LABEL, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_LEFT)
            GuiSetStyle(#BUTTON, #BORDER_WIDTH, 2)
            GuiSetStyle(#SLIDER, #TEXT_PADDING, 5)
            GuiSetStyle(#CHECKBOX, #TEXT_PADDING, 5)
            GuiSetStyle(#CHECKBOX, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_RIGHT)
            GuiSetStyle(#TEXTBOX, #TEXT_PADDING, 5)
            GuiSetStyle(#TEXTBOX, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_LEFT)
            GuiSetStyle(#VALUEBOX, #TEXT_PADDING, 4)
            GuiSetStyle(#VALUEBOX, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_LEFT)
            GuiSetStyle(#SPINNER, #TEXT_PADDING, 4)
            GuiSetStyle(#SPINNER, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_LEFT)
            GuiSetStyle(#STATUSBAR, #TEXT_PADDING, 6)
            GuiSetStyle(#STATUSBAR, #TEXT_ALIGNMENT, #GUI_TEXT_ALIGN_LEFT)

            ; Initialize extended property values
            ; NOTE: By default, extended property values are initialized to 0
            GuiSetStyle(#DEFAULT, #TEXT_SIZE, 10)                   ; DEFAULT, shared by all controls
            GuiSetStyle(#DEFAULT, #TEXT_SPACING, 1)                 ; DEFAULT, shared by all controls
            GuiSetStyle(#DEFAULT, #LINE_COLOR, $90abb5ff)           ; DEFAULT specific property
            GuiSetStyle(#DEFAULT, #BACKGROUND_COLOR, $f5f5f5ff)     ; DEFAULT specific property
            GuiSetStyle(#TOGGLE, #GROUP_PADDING, 2)
            GuiSetStyle(#SLIDER, #SLIDER_WIDTH, 15)
            GuiSetStyle(#SLIDER, #SLIDER_PADDING, 1)
            GuiSetStyle(#PROGRESSBAR, #PROGRESS_PADDING, 1)
            GuiSetStyle(#CHECKBOX, #CHECK_PADDING, 1)
            GuiSetStyle(#COMBOBOX, #COMBO_BUTTON_WIDTH, 30)
            GuiSetStyle(#COMBOBOX, #COMBO_BUTTON_PADDING, 2)
            GuiSetStyle(#DROPDOWNBOX, #ARROW_PADDING, 16)
            GuiSetStyle(#DROPDOWNBOX, #DROPDOWN_ITEMS_PADDING, 2)
            GuiSetStyle(#TEXTBOX, #TEXT_LINES_PADDING, 5)
            GuiSetStyle(#TEXTBOX, #TEXT_INNER_PADDING, 4)
            GuiSetStyle(#TEXTBOX, #COLOR_SELECTED_FG, $f0fffeff)
            GuiSetStyle(#TEXTBOX, #COLOR_SELECTED_BG, $839affe0)
            GuiSetStyle(#SPINNER, #SPIN_BUTTON_WIDTH, 20)
            GuiSetStyle(#SPINNER, #SPIN_BUTTON_PADDING, 2)
            GuiSetStyle(#SCROLLBAR, #BORDER_WIDTH, 0)
            GuiSetStyle(#SCROLLBAR, #ARROWS_VISIBLE, 0)
            GuiSetStyle(#SCROLLBAR, #ARROWS_SIZE, 6)
            GuiSetStyle(#SCROLLBAR, #SCROLL_SLIDER_PADDING, 0)
            GuiSetStyle(#SCROLLBAR, #SCROLL_SLIDER_SIZE, 16)
            GuiSetStyle(#SCROLLBAR, #SCROLL_PADDING, 0)
            GuiSetStyle(#SCROLLBAR, #SCROLL_SPEED, 10)
            GuiSetStyle(#LISTVIEW, #LIST_ITEMS_HEIGHT, $1e)
            GuiSetStyle(#LISTVIEW, #LIST_ITEMS_PADDING, 2)
            GuiSetStyle(#LISTVIEW, #SCROLLBAR_WIDTH, 10)
            GuiSetStyle(#LISTVIEW, #SCROLLBAR_SIDE, #SCROLLBAR_RIGHT_SIDE)
            GuiSetStyle(#COLORPICKER, #COLOR_SELECTOR_SIZE, 6)
            GuiSetStyle(#COLORPICKER, #HUEBAR_WIDTH, $14)
            GuiSetStyle(#COLORPICKER, #HUEBAR_PADDING, $a)
            GuiSetStyle(#COLORPICKER, #HUEBAR_SELECTOR_HEIGHT, 6)
            GuiSetStyle(#COLORPICKER, #HUEBAR_SELECTOR_OVERFLOW, 2)
            
            GetFontDefault(@guiFont)  ; Initialize default font
    EndProcedure
    
    ;>---------------------------------------------------------------------------------
    ; Module specific Functions Definition
    ;>---------------------------------------------------------------------------------

    ; Gui get text width using default font
    Procedure.i GetTextWidth(text.s)
        Protected size.Vector2

        If text <> ""
            MeasureTextEx(@size, @guiFont, text, GuiGetStyle(#DEFAULT, #TEXT_SIZE),
                                                 GuiGetStyle(#DEFAULT, #TEXT_SPACING))
        EndIf

        ; TODO: Consider text icon width here???

        ProcedureReturn size\x
    EndProcedure


    ; Get text bounds considering control bounds
    Procedure GetTextBounds(*out_textBounds.Rectangle, control, *in_bounds.Rectangle)
        If Not *out_textBounds Or Not *in_bounds
            ProcedureReturn
        EndIf

        *out_textBounds\x = *in_bounds\x + GuiGetStyle(control, #BORDER_WIDTH)
        *out_textBounds\y = *in_bounds\y + GuiGetStyle(control, #BORDER_WIDTH)
        *out_textBounds\width  = *in_bounds\width -  2*GuiGetStyle(control, #BORDER_WIDTH)
        *out_textBounds\height = *in_bounds\height - 2*GuiGetStyle(control, #BORDER_WIDTH)

        ; Consider TEXT_PADDING properly, depends on control type and TEXT_ALIGNMENT
        Select control
            Case #COMBOBOX
                ;Protected width = *in_bounds\width
                ;width - (GuiGetStyle(control, #COMBO_BUTTON_WIDTH) + GuiGetStyle(control, #COMBO_BUTTON_PADDING))
            Case #VALUEBOX
                ; NOTE: ValueBox text value always centered, text padding applies to label
            Default
                If GuiGetStyle(control, #TEXT_ALIGNMENT) = #GUI_TEXT_ALIGN_RIGHT
                    *out_textBounds\x - GuiGetStyle(control, #TEXT_PADDING)
                Else
                    *out_textBounds\x + GuiGetStyle(control, #TEXT_PADDING)
                EndIf
        EndSelect

        ; TODO: Special cases (no label): COMBOBOX, DROPDOWNBOX, LISTVIEW (scrollbar?)
        ; More special cases (label side): CHECKBOX, SLIDER, VALUEBOX, SPINNER
    EndProcedure


    Procedure.s GetTextIcon(text.s, *iconId.Integer)
        If *iconId
            *iconId\i = -1
        EndIf
        ProcedureReturn text
    EndProcedure


    ; Gui draw text using default font
    Procedure GuiDrawText(text.s, *in_bounds.Rectangle, alignment, tint)
        If Not *in_bounds : ProcedureReturn : EndIf

        If text <> ""
            Protected iconId = -1
            text = GetTextIcon(text, @iconId)   ; Check text for icon and move cursor

            ; Get text position depending on alignment and iconId
            ;>--------------------------------------------------------------------------------

            Protected position.Vector2
            InitVector2(@position, *in_bounds\x, *in_bounds\y)

            ; NOTE: We get text size after icon been processed
            Protected textWidth  = GetTextWidth(text)
            Protected textHeight = GuiGetStyle(#DEFAULT, #TEXT_SIZE)
            Protected h = *in_bounds\height
            Protected offset = TEXT_VALIGN_PIXEL_OFFSET(h)
;    #if Defined(RAYGUI_SUPPORT_ICONS)
;            If iconId >= 0
;                textWidth + #RICON_SIZE;
;
;                // WARNING: If only icon provided, text could be pointing To eof character!
;                If ((text != NULL) && (text[0] != '\0')) textWidth += ICON_TEXT_PADDING;
;            endif
;    #endif
            ; Check guiTextAlign global variables
            Select alignment
                Case #GUI_TEXT_ALIGN_LEFT
                    position\x = *in_bounds\x
                    position\y = *in_bounds\y + *in_bounds\height/2 - textHeight/2 + offset
                Case #GUI_TEXT_ALIGN_CENTER:
                    position\x = *in_bounds\x + *in_bounds\width/2 - textWidth/2
                    position\y = *in_bounds\y + *in_bounds\height/2 - textHeight/2 + offset
                Case #GUI_TEXT_ALIGN_RIGHT:
                    position\x = *in_bounds\x + *in_bounds\width - textWidth
                    position\y = *in_bounds\y + *in_bounds\height/2 - textHeight/2 + offset
            EndSelect

            ; NOTE: Make sure we get pixel-perfect coordinates,
            ; In case of decimals we got weird text positioning
            position\x = Int(position\x)
            position\y = Int(position\y)
            ;>--------------------------------------------------------------------------------

            ; Draw text (with icon if available)
            ;>--------------------------------------------------------------------------------
;    #if Defined(RAYGUI_SUPPORT_ICONS)
;            If (iconId >= 0)
;            {
;                ; NOTE: We consider icon height, probably different than text size
;                GuiDrawIcon(iconId, RAYGUI_CLITERAL(Vector2){ position.x, bounds.y + bounds.height/2 - RICON_SIZE/2 + TEXT_VALIGN_PIXEL_OFFSET(bounds.height) }, 1, tint);
;                position.x += (RICON_SIZE + ICON_TEXT_PADDING);
;            }
;    #endif
            DrawTextEx(@guiFont, text, @position, GuiGetStyle(#DEFAULT, #TEXT_SIZE), GuiGetStyle(#DEFAULT, #TEXT_SPACING), tint)
            ;>--------------------------------------------------------------------------------
        EndIf
    EndProcedure


    ; Gui draw rectangle using default raygui plain style with borders
    Procedure GuiDrawRectangle(*in_rec.Rectangle, borderWidth, borderColor, color)
        If Not *in_rec : ProcedureReturn : EndIf
        
        If Alpha(color) > 0
            ; Draw rectangle filled With color
            DrawRectangle(*in_rec\x, *in_rec\y, *in_rec\width, *in_rec\height, color)
        EndIf

        If borderWidth > 0
            ; Draw rectangle border lines With color
            DrawRectangle(*in_rec\x, *in_rec\y, *in_rec\width, borderWidth, borderColor)
            DrawRectangle(*in_rec\x, *in_rec\y + borderWidth, borderWidth, *in_rec\height - 2*borderWidth, borderColor)
            DrawRectangle(*in_rec\x + *in_rec\width - borderWidth, *in_rec\y + borderWidth, borderWidth, *in_rec\height - 2*borderWidth, borderColor)
            DrawRectangle(*in_rec\x, *in_rec\y + *in_rec\height - borderWidth, *in_rec\width, borderWidth, borderColor)
        EndIf

        ; TODO: For n-patch-based style we would need: [state] And maybe [control]
        ; In this Case all controls drawing logic should be moved To this function... I don't like it...
    EndProcedure


    ; Draw tooltip relatively to bounds
    Procedure GuiDrawTooltip(*in_bounds.Rectangle)
        If Not *in_bounds : ProcedureReturn : EndIf

        ;static int tooltipFramesCounter = 0;  // Not possible gets reseted at second function call!

        Protected.Vector2 mousePosition, textSize
        GetMousePosition(@mousePosition)
        If guiTooltipEnabled And guiTooltip And CheckCollisionPointRec(@mousePosition, @*in_bounds)
            MeasureTextEx(@textSize, @guiFont, guiTooltip, GuiGetStyle(#DEFAULT, #TEXT_SIZE),
                                                           GuiGetStyle(#DEFAULT, #TEXT_SPACING))
            Protected.Rectangle tooltipBounds
            InitRectangle(@tooltipBounds, mousePosition\x, mousePosition\y, textSize\x + 20, textSize\y*2 )

            GuiDrawRectangle(@tooltipBounds, 1, Fade(GetColor(GuiGetStyle(#DEFAULT, #LINE_COLOR)), guiAlpha),
                                                Fade(GetColor(GuiGetStyle(#DEFAULT, #BACKGROUND_COLOR)), guiAlpha))

            tooltipBounds\x + 10
            GuiLabel(@tooltipBounds, guiTooltip)
        EndIf
    EndProcedure
    
EndModule
;- -- Module End
;} -- Module End


DisableExplicit
