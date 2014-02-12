#include <GuiToolbar.au3>
#include <GuiConstantsEx.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hToolbar, $fEnabled

	Run("explorer.exe /root, ,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}")
	WinWaitActive("Arbeitsplatz")
	Sleep(1000)
	$hToolbar = _GUICtrlToolbar_FindToolbar("[CLASS:CabinetWClass]", "&File")
	$fEnabled = _GUICtrlToolbar_GetAnchorHighlight($hToolbar)
	MsgBox(4096, "Information", "'Anchor highlight' aktiviert: " & $fEnabled)
	_GUICtrlToolbar_SetAnchorHighlight($hToolbar, Not $fEnabled)
	MsgBox(4096, "Information", "'Anchor highlight' aktiviert: " & _GUICtrlToolbar_GetAnchorHighlight($hToolbar))

EndFunc   ;==>_Main
