#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=chrome_logo_gnw_icon.ico
#AutoIt3Wrapper_Outfile=sb.exe
#AutoIt3Wrapper_Outfile_x64=sb_64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon
#include <FileConstants.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <GUIListView.au3>
#include <GDIPlus.au3>
#include <WinAPIGdi.au3>
#include <WinAPISys.au3>
#include <WinAPISysWin.au3>
#include <WinAPIRes.au3>
#include <Inet.au3>
#include 'cefau3/cefau3.au3'
#include 'addons.au3'
#include 'initial.au3'
$objErr = ObjEvent("AutoIt.Error","MyErrFunc")

Func MyErrFunc()
  ; when COM/Obj error  then only set flag and do nothing
  ConsoleWrite("err")
EndFunc

if ProcessExists(StorageRead("PID")) Then
	MsgBox(16, "Alert", "Another instance of SideBrowser is running. If you don't know that, please move your mouse to the center part of right border on your screen!")
	Exit
Else
	StorageWrite("PID", @AutoItPID)
EndIf

_WinAPI_AddFontResourceEx("Linearicons-Free.ttf")

Opt('GUIOnEventMode', 1)

Local $hDLL = DllOpen("user32.dll")

Global $browser_tabs[8][20]

Global $hGUI = GUICreate("SideBrowser4", $browser_width, $browser_height, @DesktopWidth - $browser_width, 0, $onTop = True ? $WS_POPUP : 0)
GUISetBkColor($browser_background_color)

GUIRegisterMsg($WM_LBUTTONDOWN, "_WM_LBUTTONDOWN") ; For resize
GUIRegisterMsg($WM_MOUSEMOVE, "_SetCursor") ; For cursor type change
GUIRegisterMsg(0x0005, 'OnResize')

$btn_close = GUICtrlCreateLabel(ChrW(Dec('e870')), $browser_width - $button_size, 0, $button_size, $button_size / 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Exit")
GUICtrlSetBkColor(-1, 0xe51400)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Linearicons-Free")
GUICtrlSetResizing(-1, 4 + 256)

$btn_pin_browser = GUICtrlCreateLabel(ChrW(Dec('e832')), $browser_width - $button_size * 2, 0, $button_size, $button_size / 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Linearicons-Free")
GUICtrlSetResizing(-1, 4 + 256)

$btn_settings = GUICtrlCreateLabel(ChrW(Dec('e810')), $browser_width - $button_size * 3, 0, $button_size, $button_size / 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Linearicons-Free")
GUICtrlSetResizing(-1, 4 + 256)

$btn_capture = GUICtrlCreateLabel(ChrW(Dec('e826')), $browser_width - $button_size * 4, 0, $button_size, $button_size / 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Linearicons-Free")
GUICtrlSetResizing(-1, 4 + 256)




$browser_title = GUICtrlCreateLabel("SideBrowser4 - Initializing", 16, 4, $browser_width * 3 / 4, 22)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI", 5)
GUICtrlSetResizing(-1, 2)




Global $btn_back = GUICtrlCreateLabel(ChrW(Dec("e875")), 8 + 8, 32, 32, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetBkColor(-1, 0x191919)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 14, 0, 0, 'Linearicons-Free', 5)
GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)

Global $btn_next = GUICtrlCreateLabel(ChrW(Dec("e876")), 8 + 42, 32, 32, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetBkColor(-1, 0x191919)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 14, 0, 0, 'Linearicons-Free', 3)
GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)

Global $btn_reload = GUICtrlCreateLabel(ChrW(Dec("e862")), 8 + 80, 32, 32, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetBkColor(-1, 0x191919)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 14, 0, 0, 'Linearicons-Free', 5)
GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)

Global $btn_home = GUICtrlCreateLabel(ChrW(Dec("e800")), 8 + 116, 32, 32, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetBkColor(-1, 0x191919)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 14, 0, 0, 'Linearicons-Free', 5)
GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)

Global $inp_url = GUICtrlCreateInput($url, 8 + 156, 34, $browser_width - 172 - 32 - 8, 28, $ES_LEFT)
GUICtrlSetFont(-1, 14, 0, 0, 'Segoe UI Light', 5)
GUICtrlSetResizing(-1, 2 + 4)

Global $btn_go = GUICtrlCreateLabel(ChrW(Dec("e87a")), 8 + 156 + $browser_width - 172 - 32, 32, 32, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetOnEvent(-1, "_Handle_Menu")
GUICtrlSetBkColor(-1, 0x191919)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 14, 0, 0, 'Linearicons-Free', 5)
GUICtrlSetResizing(-1, 4 + 256)

GUISetState(@SW_HIDE)

HotKeySet('{F2}', '_ShowDevTools')
HotKeySet('{F5}', '_Reload')
HotKeySet('{F6}', '_Exit')
HotKeySet('{F9}', '_Google')
HotKeySet('^{NUMPADADD}', '_ZoomIn')
HotKeySet('^{NUMPADSUB}', '_ZoomOut')

#include <init_cef.au3>
#include <events.au3>

_Create_Tab()


While 1
	Global $mousePos = MouseGetPos()
	Local $mouseX = $mousePos[0]
	Local $mouseY = $mousePos[1]

	Cef_WindowMessage()

	If $browser_display = False Then
		If $mouseX >= @DesktopWidth - 2 And $mouseY > @DesktopHeight / 3 and $mouseY < @DesktopHeight * 2 / 3 Then
			GUISetState(@SW_SHOW)
			$browser_display = True
		EndIf
	ElseIf $mouseX <= @DesktopWidth - $browser_width - 8 And Not $pinned Then
		GUISetState(@SW_HIDE)
		$browser_display = False
	EndIf
WEnd

Func _WM_LBUTTONDOWN($hWnd, $iMsg, $wParam, $lParam)
    Local $iCursorType = _GetBorder()
    If $iCursorType > 0 Then ; Cursor is set to resizing style
        $iResizeType = 0xF000 + $iCursorType
        _SendMessage($hGUI, $WM_SYSCOMMAND, $iResizeType, 0)
    EndIf
EndFunc   ;==>_WM_LBUTTONDOWN

; Set cursor to correct resizing form if mouse is over a border
Func _SetCursor()
    If _GetBorder() = 1 Then
		GUISetCursor(13, 1)
	Else
		GUISetCursor(2, 1)
    EndIf
EndFunc   ;==>_SetCursor

; Determines if mouse cursor over a border
Func _GetBorder()
    Local $aCurInfo = GUIGetCursorInfo()
    Local $aWinPos = WinGetPos($hGUI)
    Local $iSide = 0
	if UBound($aCurInfo) <> 0 Then
		If $aCurInfo[0] <= $iMargin Then $iSide = 1
	EndIf
    Return $iSide
EndFunc   ;==>_GetBorder

