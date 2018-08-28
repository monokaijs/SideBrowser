#cs
	file: base/client.au3
	author: wuuyi123
#ce

global $tag_CefClient = ( _
	$tag_CefBase & _
	'ptr GetContextMenuHandler;' & _
	'ptr GetDialogHandler;' & _
	'ptr GetDisplayHandler;' & _
	'ptr GetDownloadHandler;' & _
	'ptr GetDragHandler;' & _
	'ptr GetFindHandler;' & _
	'ptr GetFocusHandler;' & _
	'ptr GetGeolocationHandler;' & _
	'ptr GetJSDialogHandler;' & _
	'ptr GetKeyboardHandler;' & _
	'ptr GetLifeSpanHandler;' & _
	'ptr GetLoadHandler;' & _
	'ptr GetRenderHandler;' & _
	'ptr GetRequestHandler;' & _
	'ptr OnProcessMessageReceived;' _
)

global $__params_GetContextMenuHandler = 'ptr', _
	$__return_GetContextMenuHandler = 'ptr'

global $__params_GetDialogHandler = 'ptr', _
	$__return_GetDialogHandler = 'ptr'

global $__params_GetDisplayHandler = 'ptr', _
	$__return_GetDisplayHandler = 'ptr'

global $__params_GetDownloadHandler = 'ptr', _
	$__return_GetDownloadHandler = 'ptr'

global $__params_GetDragHandler = 'ptr', _
	$__return_GetDragHandler = 'ptr'

global $__params_GetFindHandler = 'ptr', _
	$__return_GetFindHandler = 'ptr'

global $__params_GetFocusHandler = 'ptr', _
	$__return_GetFocusHandler = 'ptr'

global $__params_GetGeolocationHandler = 'ptr', _
	$__return_GetGeolocationHandler = 'ptr'

global $__params_GetJSDialogHandler = 'ptr', _
	$__return_GetJSDialogHandler = 'ptr'

global $__params_GetKeyboardHandler = 'ptr', _
	$__return_GetKeyboardHandler = 'ptr'

global $__params_GetLifeSpanHandler = 'ptr', _
	$__return_GetLifeSpanHandler = 'ptr'

global $__params_GetLoadHandler = 'ptr', _
	$__return_GetLoadHandler = 'ptr'

global $__params_GetRenderHandler = 'ptr', _
	$__return_GetRenderHandler = 'ptr'

global $__params_GetRequestHandler = 'ptr', _
	$__return_GetRequestHandler = 'ptr'

global $__params_OnProcessMessageReceived = 'ptr;ptr;int;ptr', _
	$__return_OnProcessMessageReceived = 'int'

Func CefClient_Create()
	Local $ret = DllCall($__Cefau3Dll__, 'ptr', 'CefClient_Create')
	Return @error ? 0 : $ret[0]
EndFunc

func CefClient_GetContextMenuHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetContextMenuHandler, $__params_GetContextMenuHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetContextMenuHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetDialogHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetDialogHandler, $__params_GetDialogHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetDialogHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetDisplayHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetDisplayHandler, $__params_GetDisplayHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetDisplayHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetDownloadHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetDownloadHandler, $__params_GetDownloadHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetDownloadHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetDragHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetDragHandler, $__params_GetDragHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetDragHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetFindHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetFindHandler, $__params_GetFindHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetFindHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetFocusHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetFocusHandler, $__params_GetFocusHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetFocusHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetGeolocationHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetGeolocationHandler, $__params_GetGeolocationHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetGeolocationHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetJSDialogHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetJSDialogHandler, $__params_GetJSDialogHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetJSDialogHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetKeyboardHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetKeyboardHandler, $__params_GetKeyboardHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetKeyboardHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetLifeSpanHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetLifeSpanHandler, $__params_GetLifeSpanHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetLifeSpanHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetLoadHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetLoadHandler, $__params_GetLoadHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetLoadHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetRenderHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetRenderHandler, $__params_GetRenderHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetRenderHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_GetRequestHandler($self, $func)
    local $cb = dllcallbackregister($func, $__return_GetRequestHandler, $__params_GetRequestHandler)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_GetRequestHandler', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefClient_OnProcessMessageReceived($self, $func)
    local $cb = dllcallbackregister($func, $__return_OnProcessMessageReceived, $__params_OnProcessMessageReceived)
    if @error then return
    dllcall($__Cefau3Dll__, 'none', 'CefClient_OnProcessMessageReceived', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc
