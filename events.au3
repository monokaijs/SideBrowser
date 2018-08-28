Func _Create_Tab()
	For $i = 1 To $tab_count
		_WinAPI_ShowWindow($browser_tabs[$i][1], @SW_HIDE)
	Next
	$createTabReturn = CefBrowserHost_CreateBrowser($info, $client, $url, $bs, Null)
	If $createTabReturn Then
		$tab_count += 1
		$cur_tab = $tab_count

;~ 		_RenderTabs()
	EndIf
EndFunc   ;==>_Create_Tab


Func _Active_Tab($TabID)
	For $i = 1 To $tab_count
		_WinAPI_ShowWindow($browser_tabs[$i][1], @SW_HIDE)
		GUICtrlSetBkColor($browser_tabs[$i][12], 0xFFFFFF)
		GUICtrlSetFont($browser_tabs[$i][12], 10, 0, 0, "Segoe UI Light", 5)
	Next
	_WinAPI_ShowWindow($browser_tabs[$TabID][1], @SW_SHOW)
	GUICtrlSetBkColor($browser_tabs[$TabID][12], 0x2980b9)
	GUICtrlSetFont($browser_tabs[$TabID][12], 10, 0, 0, "Segoe UI Light", 5)
	$cur_tab = $TabID
EndFunc   ;==>_Active_Tab


Func _RenderTabs()
	For $i = 1 To $tab_count
		GUICtrlDelete($browser_tabs[$i][11])
		GUICtrlDelete($browser_tabs[$i][12])
	Next
	Local $countTab = 0
	For $i = 1 To $tab_count
		If $browser_tabs[$i][4] <> 'destroyed' Then
			$countTab += 1
			$tabHeadSize = 150
			$browser_tabs[$i][11] = GUICtrlCreateLabel($browser_tabs[$i][3], $button_size + 8 + $tabHeadSize * ($countTab - 1), 0, $tabHeadSize, $button_size - 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
			GUICtrlSetOnEvent(-1, '_TabClick')
			GUICtrlSetColor(-1, 0xFFFFFF)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light", 5)
			GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)
			$browser_tabs[$i][12] = GUICtrlCreateLabel("", $button_size + 8 + $tabHeadSize * ($countTab - 1), $button_size - 2, $tabHeadSize, 2, BitOR($SS_CENTER, $SS_CENTERIMAGE))
			GUICtrlSetResizing(-1, 2 + 32 + 256 + 512)
			If $i = $cur_tab Then
				GUICtrlSetBkColor(-1, 0x2980b9)
				GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light", 5)
			Else
				GUICtrlSetBkColor(-1, 0xFFFFFF)
				GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light", 5)
			EndIf
		EndIf
	Next
EndFunc   ;==>_RenderTabs

Func _TabClick()
	For $i = 1 To $tab_count
		If @GUI_CtrlId = $browser_tabs[$i][11] Then
			_Active_Tab($i)
		EndIf
	Next
EndFunc   ;==>_TabClick

Func OnAfterCreated($lifespan, $__browser)
	If (Not $browser_host) Then ; when open devtools or popup window (from target: _blank), this function be called
		ConsoleWrite("Tab Count: " & $tab_count & @CRLF)
		$cur_tab = $tab_count
		$browser_host = CefBrowser_GetHost($__browser)
		$browser_handle = CefBrowserHost_GetWindowHandle($browser_host)
		$browser_tabs[$tab_count][1] = $browser_handle
		$browser_tabs[$tab_count][2] = $__browser

		ConsoleWrite("--> Created Host: " & $browser_host & @CRLF)
		$zoom_level = CefBrowserHost_GetZoomLevel($browser_host)
		$frame = CefBrowser_GetMainFrame($__browser)
		$browser_tabs[$tab_count][7] = $browser_host
	EndIf
EndFunc   ;==>OnAfterCreated

Func _Google()
	$frame = CefBrowser_GetMainFrame($browser_tabs[$cur_tab][2])
	CefFrame_LoadUrl($frame, 'https://google.com')
EndFunc   ;==>_Google

Func OnResize()
	$win = WinGetPos("")
	$browser_width = @DesktopWidth - $win[0]
	StorageWrite("Width", $browser_width)
	WinMove($browser_tabs[$cur_tab][1], '', 8, $button_size * 1.5, $browser_width - 8, $browser_height)
EndFunc   ;==>OnResize

Func GetLifeSpanHandler($client)
	Return $lifespan
EndFunc   ;==>GetLifeSpanHandler

Func GetDisplayHandler($client)
	Return $display
EndFunc   ;==>GetDisplayHandler

Func GetKeyboardHandler($client)
	Return $keyboard
EndFunc   ;==>GetKeyboardHandler

Func GetRenderProcessHandler($client)
	Return $render_process
EndFunc   ;==>GetRenderProcessHandler

Func OnAddressChange($display, $browser, $frame, $url)
	GUICtrlSetData($inp_url, CefString_Read($url))
EndFunc   ;==>OnAddressChange

Func _Visit()
	If _WinAPI_GetFocus() = GUICtrlGetHandle($inp_url) Then
		$frame = CefBrowser_GetMainFrame($browser_tabs[$cur_tab][2])
		Local $sText = GUICtrlRead($inp_url)
		Local $beginProt = StringLeft($sText, 5)
		CefFrame_LoadUrl($frame, $sText)
	EndIf
EndFunc   ;==>_Visit

Func _Handle_Menu()
	Switch @GUI_CtrlId
		Case $btn_go
			$frame = CefBrowser_GetMainFrame($browser_tabs[$cur_tab][2])
			Local $sText = GUICtrlRead($inp_url)
			Local $beginProt = StringLeft($sText, 5)
			CefFrame_LoadUrl($frame, $sText)
		Case $btn_pin_browser
			$pinned = Not $pinned
			If $pinned Then
				GUICtrlSetColor($btn_pin_browser, 0x10CF00)
			Else
				GUICtrlSetColor($btn_pin_browser, 0xFFFFFF)
			EndIf
			GUICtrlSetFont($btn_pin_browser, 10, 0, 0, 'Linearicons-Free')
		Case $btn_back
			CefBrowser_GoBack($browser_tabs[$cur_tab][2])
		Case $btn_next
			CefBrowser_GoForward($browser_tabs[$cur_tab][2])
		Case $btn_reload
			CefBrowser_Reload($browser_tabs[$cur_tab][2])
		Case $btn_settings
			_Settings_gui()
		Case $btn_home
			$frame = CefBrowser_GetMainFrame($browser_tabs[$cur_tab][2])
			CefFrame_LoadUrl($frame, $url)
		Case $btn_capture
			$counter = StorageRead("Screenshots_Count") + 1
			$hImage = _ScreenCapture_Capture(@ScriptDir & "\screenshots\screenshot_" & $counter & ".png", @DesktopWidth - $browser_width + 8, $button_size * 1.5, @DesktopWidth - 1, $browser_height)
			StorageWrite("Screenshots_Count", $counter)
	EndSwitch
EndFunc   ;==>_Handle_Menu

Func _Settings_gui()
	Run("sbst.exe")
EndFunc   ;==>_Settings_gui

Func OnTitleChange($display, $browser, $title)
	ConsoleWrite("Change title: " & $browser & @CRLF)
	#cs
		For $i = 1 To $tab_count
		ConsoleWrite("Tab[" & $i & "]: " & $browser_tabs[$i][2] & @CRLF)
		ConsoleWrite($browser_tabs[$i][7] & " ~ " & CefBrowser_GetHost($browser) & @CRLF)
		If $browser_tabs[$i][7] = CefBrowser_GetMainFrame($browser) Then
		GUICtrlSetData($browser_tabs[$i][11], CefString_Read($title))
		$browser_tabs[$i][3] = CefString_Read($title)
		EndIf
		Next
	#ce
	GUICtrlSetData($browser_title, CefString_Read($title))
EndFunc   ;==>OnTitleChange

Func OnPreKeyEvent($keyboard, $browser, $event, $os_event, $is_keyboard_shortcut)
	Local $t_event = Cef_Struct($tag_CefKeyEventType, $event)

	If ($t_event.type == 2) Then
		If $t_event.windows_key_code == 0xd Then
			ConsoleWrite('Enter key released' & @CR)
		ElseIf $t_event.windows_key_code == 0x1b Then
			ConsoleWrite('ESC key released' & @CR)
		EndIf
	EndIf
	Return 0
EndFunc   ;==>OnPreKeyEvent

; extension
Func OnWebKitInitialized($RenderProcessHandler)
	$JsCode = FileRead("api.js")
	Local $js = StringFormat($JsCode) ;
	CefRegisterExtension('v8/app', $js, $v8h)
EndFunc   ;==>OnWebKitInitialized


Func _Exit()
	; clean object/handler created by Cefxxx_Create() function
	Cef_Release($client)
	Cef_Release($app)
	Cef_Release($lifespan)
	Cef_Release($display)
	Cef_Release($keyboard)
	Cef_PostQuitMessage()
	Exit ;
EndFunc   ;==>_Exit

Func _Go()
	;$url = GUICtrlRead($input_url)
;~ 	If ((Not StringInStr($url, 'http://')) And (Not StringInStr($url, 'https://'))) Then $url = 'http://' & $url
;~ 	CefFrame_LoadUrl($frame, GUICtrlRead($input_url))
EndFunc   ;==>_Go

Func _GoBack()
	CefBrowser_GoBack($__browser)
EndFunc   ;==>_GoBack

Func _GoForward()
	CefBrowser_GoForward($__browser)
EndFunc   ;==>_GoForward

Func _ZoomIn()
	$zoom_level += 0.1
	CefBrowserHost_SetZoomLevel(CefBrowser_GetHost($browser_tabs[$cur_tab][2]), $zoom_level)
EndFunc   ;==>_ZoomIn

Func _ZoomOut()
	$zoom_level -= 0.1
	CefBrowserHost_SetZoomLevel(CefBrowser_GetHost($browser_tabs[$cur_tab][2]), $zoom_level)
EndFunc   ;==>_ZoomOut

Func _Reload()
	If $browser_display Then
		CefBrowser_Reload($browser_tabs[$cur_tab][2])
	EndIf
EndFunc   ;==>_Reload

Func _ShowDevTools()
	If $browser_display Then
		With Cef_Struct($tag_CefWindowInfo, $info)
			.style = 0x10CF0000
			.x = 0x80000000
			.y = 0x80000000
			.width = 0x80000000
			.height = 0x80000000
		EndWith

		Local $point = _WinAPI_GetMousePos(True, $hGUI)

		CefWindowInfo_Set_window_name($info, 'Dev Tools')
		CefBrowserHost_ShowDevTools($browser_host, $info, $client, $bs, DllStructGetPtr($point))
	EndIf
EndFunc   ;==>_ShowDevTools
