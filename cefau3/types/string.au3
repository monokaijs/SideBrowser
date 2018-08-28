#cs
	file: types/string.au3
	author: wuuyi123
#ce

Global $tag_CefString = 'ptr str;int len;ptr dior;'

Func CefString_Create($string)
	Local $ret = DllCall($__Cefau3Dll__, 'ptr', 'CefString_Create', 'wstr', $string)
	Return @error ? 0 : $ret[0]
EndFunc

Func CefString_Free($CefString)
	DllCall($__Cefau3Dll__, 'none', 'CefString_Read', 'ptr', $CefString)
EndFunc

Func CefString_Read($CefString)
	Local $ret = DllCall($__Cefau3Dll__, 'wstr', 'CefString_Read', 'ptr', $CefString)
	Return @error ? 0 : $ret[0]
EndFunc

Func CefString_Len($CefString)
	Local $ret = DllCall($__Cefau3Dll__, 'uint', 'CefString_Len', 'ptr', $CefString)
	Return @error ? 0 : $ret[0]
EndFunc