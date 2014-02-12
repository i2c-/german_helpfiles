#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $sBefore, $sAfter

	; Erstellt eine GUI
	GUICreate("Edit: Mit weichen Zeilenumbr&uuml;chen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile, 500))

	; Standardm&auml;&szlig;ig enthaltener Text
	$sBefore = _GUICtrlEdit_GetText($hEdit)

	; F&uuml;gt 'soft line-break'-Zeichen (weiche Zeilenumbr&uuml;che) ein, wenn ein Wortumbruch im Editfeld die Zeile zerst&ouml;rt
	_GUICtrlEdit_FmtLines($hEdit, True)

	; Text mit weichen Zeilenumbr&uuml;chen
	$sAfter = _GUICtrlEdit_GetText($hEdit)

	MsgBox($MB_TASKMODAL, "Information", "Vorher:" & @CRLF & @CRLF & $sBefore & @CRLF & @CRLF & _
			'--------------------------------------------------------------' & @CRLF & _
			"Nachher:" & @CRLF & @CRLF & $sAfter)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
