#cs
	file: api/types_win.au3
	author: wuuyi123
#ce

global $tag_CefWindowInfo = ( _
	'dword ex_style;' & _
	$tag_CefString & _
	'dword style;' & _
	'int x;' & _
	'int y;' & _
	'int width;' & _
	'int height;' & _
	'hwnd parent_window;' & _
	'ptr menu;' & _
	'int windowless_rendering_enabled;' & _
	'hwnd window;' _
)

func CefWindowInfo_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr', 'CefWindowInfo_Create')
	return @error ? 0 : $ret[0]
endfunc

func CefWindowInfo_Set_window_name($self, $value)
	dllcall($__Cefau3Dll__, 'none', 'CefWindowInfo_Set_window_name', 'ptr', $self, 'wstr', $value)
endfunc

func CefWindowInfo_Get_window_name($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefWindowInfo_Get_window_name', 'ptr', $self)
	return @error ? null : $ret[0]
endfunc

global $tag_CefMainArgs = ( _
	'ptr instance;' _
)

func CefMainArgs_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr', 'CefMainArgs_Create')
	return @error ? 0 : $ret[0]
endfunc

; //////////////////////
