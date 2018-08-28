
Cef_Start(@ScriptDir & (@AutoItX64 ? '\cef_x64' : '\cef'))
CefEnableHighDPISupport()
Global $app = CefApp_Create(), $args = CefMainArgs_Create()
If (CefExecuteProcess($args, $app) >= 0) Then Exit

Global $settings = CefSettings_Create(), $bs = CefBrowserSettings_Create()
With Cef_Struct($tag_CefSettings, $settings)
	.log_severity = 99
	.single_process = @Compiled ? 0 : 1
	.multi_threaded_message_loop = 1
EndWith
If (CefInitialize($args, $settings, $app) == 0) Then Exit
Global $info = CefWindowInfo_Create()
CefWindowInfo_Set_window_name($info, 'Hello World!')
With Cef_Struct($tag_CefWindowInfo, $info)
	.parent_window = $hGUI ; set browser window as child, null for popup
	.style = BitOR($WS_VISIBLE, $WS_CHILD) ; browser window style, like normal window
	.x = 8 ; position
	.y = $button_size * 1.5
	.width = $browser_width - 8
	.height = $browser_height - $button_size * 1.5
EndWith

Global $client = CefClient_Create()
Global $lifespan = CefLifeSpanHandler_Create()
Global $display = CefDisplayHandler_Create()
Global $keyboard = CefKeyboardHandler_Create()
Global $render_process = CefRenderProcessHandler_Create()
Global $v8h = CefV8Handler_Create()
CefApp_GetRenderProcessHandler($app, 'GetRenderProcessHandler')
CefRenderProcessHandler_OnWebKitInitialized($render_process, 'OnWebKitInitialized')
CefV8Handler_Execute($v8h, '_Execute')
CefClient_GetLifeSpanHandler($client, 'GetLifeSpanHandler')
CefClient_GetDisplayHandler($client, 'GetDisplayHandler')
CefClient_GetKeyboardHandler($client, 'GetKeyboardHandler')

CefLifeSpanHandler_OnAfterCreated($lifespan, 'OnAfterCreated')
CefDisplayHandler_OnAddressChange($display, 'OnAddressChange')
CefDisplayHandler_OnTitleChange($display, 'OnTitleChange')
CefKeyboardHandler_OnPreKeyEvent($keyboard, 'OnPreKeyEvent')
CefRenderProcessHandler_OnWebKitInitialized($render_process, 'OnWebKitInitialized')
