Const $iMargin = 8

Global $__browser, $browser_host, $browser_tabs[99], $frame
Global $tab_count = 0, $cur_tab = 1, $oldMouseX = 0, $GUICursor = 13
Global $pinned = False
Global $browser_display = False, $browser_resizing = False, $newBrowserSize = 0
Global $onTop = StorageRead("Ontop") = "1" ? True : False
Global $zoom_level = 1, $mousePos, $browser_title

Global $hGUISettings

Const $taskbarSize = WinGetPos("[CLASS:Shell_TrayWnd]", "")[3]
Const $taskBarY = WinGetPos("[CLASS:Shell_TrayWnd]", "")[1]

If StorageRead('CoverTaskbar') = 1 Then
	Global $browser_height = @DesktopHeight
Else
	Global $browser_height = @DesktopHeight - $taskbarSize
EndIf
$browser_width = StorageRead("Width") >= 700 ? ( StorageRead("Width") <= @DesktopWidth ? StorageRead("Width") : 700) : 700
$newBrowserSize = $browser_width
$button_size = StorageRead("ButtonSize")
$browser_background_color = StorageRead("BackgroundColor")
$url = StorageRead("Homepage")


Func _GetWorkArea()
    Local $Area[6]
    Local $StartRect = DllStructCreate("int[4]")
    Local $PStartRect = DllStructGetPtr($StartRect)
    DllCall("user32.dll", "int", "SystemParametersInfo", "int", 48, "int", 0, "ptr", $PStartRect, "int", 0)
    $Area[0] = DllStructGetData($StartRect,1,1)
    $Area[1] = DllStructGetData($StartRect,1,2)
    $Area[2] = DllStructGetData($StartRect,1,3)
    $Area[3] = DllStructGetData($StartRect,1,4)
    $Area[4] = $Area[2] - $Area[0]
    $Area[5] = $Area[3] - $Area[1]
    Return $Area
EndFunc