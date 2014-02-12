#include <GuiToolbar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hToolbar, $fEnabled

	Run("explorer.exe /root, ,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}")
	WinWaitActive("Arbeitsplatz")
	Sleep(1000)
	$hToolbar = _GUICtrlToolbar_FindToolbar("[CLASS:CabinetWClass]", "&File")
	$fEnabled = _GUICtrlToolbar_GetAnchorHighlight($hToolbar)
	MsgBox($MB_SYSTEMMODAL, "Information", "'Anchor highlight' aktiviert: " & $fEnabled)
	_GUICtrlToolbar_SetAnchorHighlight($hToolbar, Not $fEnabled)
	MsgBox($MB_SYSTEMMODAL, "Information", "'Anchor highlight' aktiviert: " & _GUICtrlToolbar_GetAnchorHighlight($hToolbar))
EndFunc   ;==>Example
