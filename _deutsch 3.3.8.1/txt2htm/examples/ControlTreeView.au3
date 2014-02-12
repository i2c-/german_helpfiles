; Beispiel 1

; Author:         Zedna

#include <GUIConstantsEx.au3>
#include <TreeviewConstants.au3>
#include <WindowsConstants.au3>

$gui = GUICreate("ControlTreeview test", 212, 212)
$treeview = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
$h_tree = ControlGetHandle($gui, "", $treeview)

$root = GUICtrlCreateTreeViewItem("Root", $treeview)
$item1 = GUICtrlCreateTreeViewItem("Item 1", $root)
$item2 = GUICtrlCreateTreeViewItem("Item 2", $root)
$item3 = GUICtrlCreateTreeViewItem("Item 3", $root)
$item4 = GUICtrlCreateTreeViewItem("Item 4", $root)
$item41 = GUICtrlCreateTreeViewItem("Item 41", $item4)
$item42 = GUICtrlCreateTreeViewItem("Item 42", $item4)
$item5 = GUICtrlCreateTreeViewItem("Item 5", $root)

GUISetState(@SW_SHOW)

; Ein paar Beispiele
ControlTreeView($gui, "", $h_tree, "Expand", "Root")

ControlTreeView($gui, "", $h_tree, "Exists", "Root|Item 4")
ControlTreeView($gui, "", $h_tree, "Check", "Root|Item 4")
ControlTreeView($gui, "", $h_tree, "Select", "Root|Item 4")
ControlTreeView($gui, "", $h_tree, "Expand", "Root|Item 4")

While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
	EndSelect
WEnd



; Beispiel 2


Opt("WinTitleMatchMode", 2)

; Bei den Sounds "Windows-Abmeldung" ausw&auml;hlen

$titel = "Eigenschaften von Sounds und Audioger&auml;te"

; Sounds und Audioger&auml;te starten
Run("rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,1")
WinWait($titel)

;"Windows-Abmeldung" ausw&auml;hlen
$Eintragsname = "Windows-Abmeldung"
$winhandle = WinGetHandle($titel)
$treehandle = ControlGetHandle($winhandle, '', "SysTreeView321")
ControlFocus($winhandle, '', $treehandle)
ControlTreeView($winhandle, "", 6682, "Select", "Windows|" & $Eintragsname)
