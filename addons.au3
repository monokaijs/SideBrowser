Func StorageRead($cf_name)
	Return IniRead("config.ini", 'configs', $cf_name, '')
EndFunc

Func StorageWrite($cf_name, $cf_value)
	Return IniWrite("config.ini", 'configs', $cf_name, $cf_value)
EndFunc