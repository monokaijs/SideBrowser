#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\chrome_logo_gnw_icon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs
***
*** Author:			@monokaijs
*** Contact:		https://fb.me/monkaijs
*** Email:			monokaijs@gmail.com
*** Homepage:		https://nstudio.pw
***
***	Free for Persional usage. For Commercial usage please contact!
***
***
#ce

#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <GUIListView.au3>
#include <Misc.au3>
#include "GUICtrlOnHover.au3"


Opt('GUIOnEventMode', 1)


Const $menuStartY = 100, $menuSize = 200, $menuIconSize = 50, $iconFontSize = 20, $menuTextFontSize = 12, $menuTextFont = "Segoe UI"
Local $menuItemsCount = 0, $menuItemSelected = 1, $menuHovering = False, $menuHoveringIndex = 0
Local $menuItems[99], $menuLabels[99]
Global $iStart, $iEnd, $cur_Scene, $initialized, $inp_homepage

$hGUI = GUICreate("SideBrowser :: Settings", 800, 300, -1, -1)
GUISetBkColor(0xFFFFFF)

GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

_WinAPI_AddFontResourceEx("Linearicons-Free.ttf")

$menu_itm1 = _Create_MenuItem(ChrW(Dec('e810')), "General")
$menu_itm2 = _Create_MenuItem(ChrW(Dec('e82a')), "Personalize")
$menu_itm3 = _Create_MenuItem(ChrW(Dec('e822')), "About")
$menuSelectedMarker = GUICtrlCreateLabel("", 0,0, 3, 30)
GUICtrlSetBkColor(-1, 0x000000)
_Reset_Menu_Selected_Marker()
$iStart = GUICtrlCreateDummy()
$iEnd = GUICtrlCreateDummy()
_Scene()
GUISetState(@SW_SHOW)
While 1
	If _IsPressed(0x01) Then
		if $menuHovering Then
			$menuItemSelected = $menuHoveringIndex
			_Reset_Menu_Selected_Marker()
		EndIf
	EndIf
WEnd

Func _Exit()
	Exit
EndFunc

Func _Menu_Handle()
	Switch @GUI_CtrlId
		Case $menuItems[$menu_itm1], $menuLabels[$menu_itm1]
			_Scene("general")
		Case $menuItems[$menu_itm2], $menuLabels[$menu_itm2]
			_Scene("personalize")
		Case $menuItems[$menu_itm3], $menuLabels[$menu_itm3]
			_Scene("about")
	EndSwitch
EndFunc

Func _Scene($sceneName = "general")
	$cur_Scene = $sceneName
	ConsoleWrite("_Scene")
	ConsoleWrite($iStart & "-" & $iEnd &@CRLF)
	For $i = $iStart to $iEnd
		GUICtrlDelete($i)
	Next
	$iStart = GUICtrlCreateDummy()
	Switch $sceneName
		Case "general"
			$SiteName = GUICtrlCreateLabel("General", 210, 20, 400, 80)
			GUICtrlSetFont(-1, 24, 0, 0, "Segoe UI Light")
			$Section1 = GUICtrlCreateLabel("Navigating", 210, 100, 400, 40)
			GUICtrlSetFont(-1, 16, 0, 0, "Segoe UI Light")
			$lb_homepage = GUICtrlCreateLabel("Home", 210, 160, 100)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light")
			$inp_homepage = GUICtrlCreateInput(StorageRead("Homepage"), 310, 160, 380, 22)
			$btn_save = GUICtrlCreateLabel("Save", 800 - 110, 300 - 40, 100, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE))
			GUICtrlSetOnEvent(-1, "_Save_General")
			GUICtrlSetBkColor(-1, 0x000000)
			GUICtrlSetColor(-1, 0xFFFFFF)
		Case "personalize"
			$SiteName = GUICtrlCreateLabel("Personalize", 210, 20, 400, 80)
			GUICtrlSetFont(-1, 24, 0, 0, "Segoe UI Light")
			$Section1 = GUICtrlCreateLabel("Safe-Browsing", 210, 100, 400, 40)
			GUICtrlSetFont(-1, 16, 0, 0, "Segoe UI Light")
			$lb_desc = GUICtrlCreateLabel("By default, we only allow Incognito for now.", 210, 160, 300)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light")
			$lb_cache = GUICtrlCreateLabel("Cache", 210, 200, 100)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light")
			GUICtrlCreateInput("Unavailable", 310, 200, 380, 22)
		Case "about"
			$SiteName = GUICtrlCreateLabel("About", 210, 20, 400, 80)
			GUICtrlSetFont(-1, 24, 0, 0, "Segoe UI Light")
			$Section1 = GUICtrlCreateLabel("Author", 210, 100, 400, 40)
			GUICtrlSetFont(-1, 16, 0, 0, "Segoe UI Light")
			$lb_desc = GUICtrlCreateLabel("This is a Free & Open-Source Project made by NorthStudio (@MonokaiJs/@namlunthkl). This Project using Public Copyright License " & _
			"to protect Author's right to Project's Legal copyright of Software. You can use, build, edit this Program's source for Non-Commercial, Education, Self-learning " & _
			" purpose. All others uses need Author's appoval.", 210, 160, 580, 80)
			GUICtrlSetFont(-1, 10, 0, 0, "Segoe UI Light")
			$btn_project_home = GUICtrlCreateLabel("Project's home", 800 - 110, 300 - 40, 100, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE))
			GUICtrlSetOnEvent($btn_project_home, "_Home")
			GUICtrlSetBkColor(-1, 0x000000)
			GUICtrlSetColor(-1, 0xFFFFFF)
	EndSwitch
	$iEnd = GUICtrlCreateDummy()
	$initialized =True
EndFunc

Func _Save_General()
	StorageWrite("Homepage", GUICtrlRead($inp_homepage))
EndFunc

Func _Home()
	ShellExecute("https://nstudio.pw/SideBrowser/")
EndFunc

Func _Reset_Menu_Selected_Marker()
	GUICtrlSetPos($menuSelectedMarker, 0, $menuStartY + $menuIconSize*($menuItemSelected-1) + 10)
EndFunc

Func _Create_MenuItem($icn, $txt)
	$menuItemsCount += 1
	$menuItems[$menuItemsCount] = GUICtrlCreateLabel($icn, 0, $menuStartY + ($menuItemsCount - 1)*$menuIconSize, $menuIconSize, $menuIconSize, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetFont(-1, $iconFontSize, 0, 0, "Linearicons-Free", 5)
	GUICtrlSetOnEvent(-1, "_Menu_Handle")
	$menuLabels[$menuItemsCount] = GUICtrlCreateLabel($txt, $menuIconSize, $menuStartY + ($menuItemsCount - 1)*$menuIconSize, $menuSize - $menuIconSize, $menuIconSize, $SS_CENTERIMAGE)
	GUICtrlSetFont(-1, $menuTextFontSize, 0, 0, $menuTextFont)
	GUICtrlSetOnEvent(-1, "_Menu_Handle")
	_GUICtrl_OnHoverRegister($menuItems[$menuItemsCount], "_Menu_Hover", "_Menu_Hover")
	_GUICtrl_OnHoverRegister($menuLabels[$menuItemsCount], "_Menu_Hover", "_Menu_Hover")
	Return($menuItemsCount)
EndFunc

Func _Menu_Hover($itm, $prm)
	if $prm = 2 Then ; Not hovered
		GUICtrlSetBkColor($itm, 0xFFFFFF)
		For $i = 1 to $menuItemsCount
			if $menuItems[$i] = $itm Then
				GUICtrlSetBkColor($menuLabels[$i], 0xFFFFFF)
			elseif $menuLabels[$i] = $itm Then
				GUICtrlSetBkColor($menuItems[$i], 0xFFFFFF)
			EndIf
		Next
		$menuHovering = False
	Else ; Hovering
		GUICtrlSetBkColor($itm, 0xAAAAAA)
		For $i = 1 to $menuItemsCount
			if $menuItems[$i] = $itm Then
				$menuHoveringIndex = $i
				GUICtrlSetBkColor($menuLabels[$i], 0xAAAAAA)
			elseif $menuLabels[$i] = $itm Then
				$menuHoveringIndex = $i
				GUICtrlSetBkColor($menuItems[$i], 0xAAAAAA)
			EndIf
		Next
		$menuHovering = True
	EndIf
EndFunc

Func StorageRead($cf_name)
	Return IniRead("config.ini", 'configs', $cf_name, '')
EndFunc

Func StorageWrite($cf_name, $cf_value)
	Return IniWrite("config.ini", 'configs', $cf_name, $cf_value)
EndFunc