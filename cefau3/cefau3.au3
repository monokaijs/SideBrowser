#cs

Name:.............: Cefau3 - Chromium Embedded Frame Work for AutoIt3
AutoIt version:...: v3.3.14.5
Author:...........: wuuyi123
Page:.............: https://github.com/wy3/cefau3

program/
	|---app/...
	|	|---css/...			# style
	|	|---js/...			# javascript
	|	|---app.js			# app
	|	|---index.html		# index
	|
	|---cef/...				# resources
	|	|---locales/...
	|	|---autoitx3.dll	# autoitx3
	|	|---libcef.dll		# libcef
	|	|---cefau3.dll		# cefau3
	|
	|---include/...			# your autoit header
	|---cefau3/...			# cefau3 udf
	|	|---base/...
	|	|---cefau3.au3
	|
	|---main.au3			# main script
	|...

#ce

global $__Cefau3Dll__ = null
global $__Cefau3DllName__ = 'cefau3.dll'

#include <WinAPISysWin.au3>
#include <WinAPIMisc.au3>

#include './base/base.au3'
#include './base/app.au3'
#include './base/client.au3'

#include './types/windows.au3'
#include './types/string.au3'
#include './types/ptr.au3'

#include './api/life_span_handler.au3'
#include './api/display_handler.au3'
#include './api/keyboard_handler.au3'
#include './api/render_process_handler.au3'
#include './api/browser.au3'
#include './api/frame.au3'
#include './api/types.au3'
#include './api/types_win.au3'
#include './api/v8.au3'

func Cef_Start($CefPath = @ScriptDir & '\cef')
	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', $CefPath)
	local $ret = dllopen($__Cefau3DllName__)
	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', @ScriptDir)
	if @error or ($ret == -1) then return 0
	$__Cefau3Dll__ = $ret
	Cef_CreateWindowMessage()
	return 1
endfunc

func Cef_Release($CefHandler)
	if (not $CefHandler) then return
	dllcall($__Cefau3Dll__, 'none', 'Cef_Release', 'ptr', $CefHandler)
endfunc

func Cef_End()
	if ($__Cefau3Dll__) then DllClose($__Cefau3Dll__)
endfunc

func Cef_Struct($tag, $pointer = default)
	if ($pointer = default or not $pointer) then
		return DllStructCreate($tag)
	else
		return DllStructCreate($tag, $pointer)
	endif
endfunc

func Cef_GetVersion()
	local $ret = dllcall($__Cefau3Dll__, 'str', 'Cef_GetVersion')
	return @error ? null : $ret[0]
endfunc

func Cef_GetChromiumVersion()
	local $t = DllStructCreate('int[3]')
	local $ret = dllcall($__Cefau3Dll__, 'none', 'Cef_GetChromiumVersion', 'ptr', dllstructgetptr($t, 1))
	return @error ? null : (dllstructgetdata($t, 1, 1) & '.' & dllstructgetdata($t, 1, 2) & '.' & dllstructgetdata($t, 1, 3))
endfunc

func Cef_CreateWindowMessage()
	local $ret = dllcall($__Cefau3Dll__, 'hwnd', 'Cef_CreateWindowMessage')
	return @error ? null : $ret[0]
endfunc

func Cef_WindowMessage()
	dllcall($__Cefau3Dll__, 'none', 'Cef_WindowMessage')
endfunc

func Cef_PostQuitMessage($code = 0)
	dllcall($__Cefau3Dll__, 'none', 'Cef_PostQuitMessage', 'int', $code)
endfunc
