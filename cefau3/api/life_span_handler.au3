#cs
	file: api/life_span_handler.au3
	author: wuuyi123
#ce

Global $tag_CefLifeSpanHandler = $tag_CefBase & _
	'ptr OnBeforePopup;' & _
	'ptr OnAfterCreated;' & _
	'ptr DoClose;' & _
	'ptr OnBeforeClose;'

Global $__params_OnBeforePopup = 'ptr;ptr;ptr;ptr;ptr;int;ptr;ptr;ptr;ptr;ptr', _
	$__return_OnBeforePopup = 'int'

Global $__params_OnAfterCreated = 'ptr;ptr', _
	$__return_OnAfterCreated = 'none'

Global $__params_DoClose = 'ptr;ptr', _
	$__return_DoClose = 'int'

Global $__params_OnBeforeClose = 'ptr;ptr', _
	$__return_OnBeforeClose = 'none'

Func CefLifeSpanHandler_Create()
	Local $ret = DllCall($__Cefau3Dll__, 'ptr', 'CefLifeSpanHandler_Create')
	Return @error ? 0 : $ret[0]
EndFunc

func CefLifeSpanHandler_OnBeforePopup($self, $func)
    local $cb = dllcallbackregister($func, $__return_OnBeforePopup, $__params_OnBeforePopup)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefLifeSpanHandler_OnBeforePopup', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefLifeSpanHandler_OnAfterCreated($self, $func)
    local $cb = dllcallbackregister($func, $__return_OnAfterCreated, $__params_OnAfterCreated)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefLifeSpanHandler_OnAfterCreated', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefLifeSpanHandler_DoClose($self, $func)
    local $cb = dllcallbackregister($func, $__return_DoClose, $__params_DoClose)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefLifeSpanHandler_DoClose', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefLifeSpanHandler_OnBeforeClose($self, $func)
    local $cb = dllcallbackregister($func, $__return_OnBeforeClose, $__params_OnBeforeClose)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefLifeSpanHandler_OnBeforeClose', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc
