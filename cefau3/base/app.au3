#cs
	file: base/app.au3
	author: wuuyi123
#ce

global $tag_CefApp = $tag_CefBase 			& _
	'ptr OnBeforeCommandLineProcessing;' 	& _
	'ptr OnRegisterCustomSchemes;' 			& _
	'ptr GetResourceBundleHandler;' 		& _
	'ptr GetBrowserProcessHandler; '		& _
	'ptr GetRenderProcessHandler;'

global $__params_OnBeforeCommandLineProcessing = 'ptr;ptr;ptr', _
	$__return_OnBeforeCommandLineProcessing = 'none'

global $__params_OnRegisterCustomSchemes = 'ptr;ptr', _
	$__return_OnRegisterCustomSchemes = 'none'

global $__params_GetResourceBundleHandler = 'ptr', _
	$__return_GetResourceBundleHandler = 'ptr'

global $__params_GetBrowserProcessHandler = 'ptr', _
	$__return_GetBrowserProcessHandler = 'ptr'

global $__params_GetRenderProcessHandler = 'ptr', _
	$__return_GetRenderProcessHandler = 'ptr'

func CefApp_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr', 'CefApp_Create')
	return @error ? 0 : $ret[0]
endfunc


func CefApp_OnBeforeCommandLineProcessing($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnBeforeCommandLineProcessing, $__params_OnBeforeCommandLineProcessing)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none', 'CefApp_OnBeforeCommandLineProcessing', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefApp_OnRegisterCustomSchemes($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnRegisterCustomSchemes, $__params_OnRegisterCustomSchemes)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none', 'CefApp_OnRegisterCustomSchemes', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefApp_GetResourceBundleHandler($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_GetResourceBundleHandler, $__params_GetResourceBundleHandler)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none', 'CefApp_GetResourceBundleHandler', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefApp_GetBrowserProcessHandler($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_GetBrowserProcessHandler, $__params_GetBrowserProcessHandler)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none', 'CefApp_GetBrowserProcessHandler', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefApp_GetRenderProcessHandler($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_GetRenderProcessHandler, $__params_GetRenderProcessHandler)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none', 'CefApp_GetRenderProcessHandler', 'ptr', $self, 'ptr', $ptr)
endfunc

; /////////////////////////////////////////////



func CefExecuteProcess($CefMainArgs, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int', 'CefExecuteProcess', _
		'ptr', $CefMainArgs, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefInitialize($CefMainArgs, $CefSettings, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int', 'CefInitialize', _
		'ptr', $CefMainArgs, _
		'ptr', $CefSettings, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefShutdown()
	dllcall($__Cefau3Dll__, 'none', 'CefShutdown')
endfunc

func CefDoMessageLoopWork()
	dllcall($__Cefau3Dll__, 'none', 'CefDoMessageLoopWork')
endfunc

func CefRunMessageLoop()
	dllcall($__Cefau3Dll__, 'none', 'CefRunMessageLoop')
endfunc

func CefQuitMessageLoop()
	dllcall($__Cefau3Dll__, 'none', 'CefQuitMessageLoop')
endfunc

func CefSetOSModalLoop($osModalLoop)
	dllcall($__Cefau3Dll__, 'none', 'CefSetOSModalLoop', _
		'int', $osModalLoop _
	)
endfunc

func CefEnableHighDPISupport()
	dllcall($__Cefau3Dll__, 'none', 'CefEnableHighDPISupport')
endfunc