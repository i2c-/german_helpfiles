#include <String.au3> ;_StringBetween
#include <GUIConstants.au3> ;$GUI_EVENT_CLOSE

$hGUI = GUICreate("Test", 250, 250)
$idOutput = GUICtrlCreateLabel("", 50, 100, 150, 20)
$idInput = GUICtrlCreateInput("Kein Text:Text:Kein Text", 50, 150, 150, 20)
$idOK = GUICtrlCreateButton("&Uuml;bernehmen", 50, 200, 150, 20)

GUISetState()

While True
	$iMsg = GUIGetMsg()
	Switch $iMsg
		Case $GUI_EVENT_CLOSE ;GUIConstants.au3
			Exit
		Case $idOK
			$aCut = _StringBetween(GUICtrlRead($idInput), ":", ":") ;String.au3
			If IsArray($aCut) Then
				GUICtrlSetData($idOutput, $aCut[0])
			EndIf
	EndSwitch
WEnd
