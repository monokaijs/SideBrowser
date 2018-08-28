#cs
	file: api/types.au3
	author: wuuyi123
#ce

global $tag_CefSettings = ( _
	'uint size;' & _
	'int single_process;' & _
	'int no_sandbox;' & _
	$tag_CefString & _
	$tag_CefString & _
	'int multi_threaded_message_loop;' & _
	'int external_message_pump;' & _
	'int windowless_rendering_enabled;' & _
	'int command_line_args_disabled;' & _
	$tag_CefString & _
	$tag_CefString & _
	'int persist_session_cookies;' & _
	'int persist_user_preferences;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int log_severity;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int pack_loading_disabled;' & _
	'int remote_debugging_port;' & _
	'int uncaught_exception_stack_size;' & _
	'int ignore_certificate_errors;' & _
	'int enable_net_security_expiration;' & _
	'uint background_color;' & _
	$tag_CefString _
)

func CefSettings_Create()
	Local $ret = DllCall($__Cefau3Dll__, 'ptr', 'CefSettings_Create')
	Return @error ? 0 : $ret[0]
EndFunc

func CefSettings_Set_browser_subprocess_path($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_browser_subprocess_path', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_browser_subprocess_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_browser_subprocess_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_framework_dir_path($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_framework_dir_path', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_framework_dir_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_framework_dir_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_cache_path($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_cache_path', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_cache_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_cache_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_user_data_path($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_user_data_path', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_user_data_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_user_data_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_user_agent($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_user_agent', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_user_agent($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_user_agent', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_product_version($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_product_version', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_product_version($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_product_version', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_locale($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_locale', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_locale($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_locale', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_log_file($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_log_file', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_log_file($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_log_file', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_javascript_flags($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_javascript_flags', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_javascript_flags($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_javascript_flags', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_resources_dir_pat($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_resources_dir_pat', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_resources_dir_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_resources_dir_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_locales_dir_path($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_locales_dir_path', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_locales_dir_path($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_locales_dir_path', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefSettings_Set_accept_language_list($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefSettings_Set_accept_language_list', 'ptr', $self, 'wstr', $value)
endfunc

func CefSettings_Get_accept_language_list($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefSettings_Get_accept_language_list', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

global $tag_CefBrowserSettings = ( _
	'uint size;' & _
	'int windowless_frame_rate;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int default_font_size;' & _
	'int default_fixed_font_size;' & _
	'int minimum_font_size;' & _
	'int minimum_logical_font_size;' & _
	$tag_CefString & _
	'int remote_fonts;' & _
	'int javascript;' & _
	'int javascript_close_windows;' & _
	'int javascript_access_clipboard;' & _
	'int javascript_dom_paste;' & _
	'int plugins;' & _
	'int universal_access_from_file_urls;' & _
	'int file_access_from_file_urls;' & _
	'int web_security;' & _
	'int image_loading;' & _
	'int image_shrink_standalone_to_fit;' & _
	'int text_area_resize;' & _
	'int tab_to_links;' & _
	'int local_storage;' & _
	'int databases;' & _
	'int application_cache;' & _
	'int webgl;' & _
	'uint background_color;' & _
	$tag_CefString _
)

func CefBrowserSettings_Create()
	Local $ret = DllCall($__Cefau3Dll__, 'ptr', 'CefBrowserSettings_Create')
	Return @error ? 0 : $ret[0]
EndFunc

func CefBrowserSettings_Set_standard_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_standard_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_standard_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_standard_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_fixed_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_fixed_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_fixed_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_fixed_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_serif_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_serif_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_serif_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_serif_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_sans_serif_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_sans_serif_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_sans_serif_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_sans_serif_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_cursive_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_cursive_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_cursive_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_cursive_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_fantasy_font_family($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_fantasy_font_family', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_fantasy_font_family($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_fantasy_font_family', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_default_encoding($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_default_encoding', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_default_encoding($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_default_encoding', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc

func CefBrowserSettings_Set_accept_language_list($self, $value)
    dllcall($__Cefau3Dll__, 'none', 'CefBrowserSettings_Set_accept_language_list', 'ptr', $self, 'wstr', $value)
endfunc

func CefBrowserSettings_Get_accept_language_list($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr', 'CefBrowserSettings_Get_accept_language_list', 'ptr', $self)
    return @error ? null : $ret[0]
endfunc


; ////////////////////////////////////////////////

global $tag_CefKeyEventType = ( _
	'int type;' & _
	'uint modifiers;' & _
	'int windows_key_code;' & _
	'int native_key_code;' & _
	'wchar character;' & _
	'wchar unmodified_character;' & _
	'int focus_on_editable_field;' _
)
