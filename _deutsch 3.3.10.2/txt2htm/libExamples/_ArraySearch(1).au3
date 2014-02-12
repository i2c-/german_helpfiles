#include <Array.au3>
#include <MsgBoxConstants.au3>

;verwendet ein 1D Array

Local $avArray[6] = [ _
		"String0, SubString0", _
		"String1, SubString1", _
		"String2, SubString2", _
		"String3, SubString3", _
		"String4, SubString4", _
		"String5, SubString5"]

_ArrayDisplay($avArray, "$avArray")

Local $sSearch = InputBox("_ArraySearch() Demo", "Welcher String soll gesucht werden?")
If @error Then Exit

Local $iIndex = _ArraySearch($avArray, $sSearch, 0, 0, 0, 1)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Nicht gefunden", '"' & $sSearch & '" wurde in dem Array nicht gefunden.')
Else
	MsgBox($MB_SYSTEMMODAL, "Gefunden", '"' & $sSearch & '" wurde in dem Array an Stelle ' & $iIndex & " gefunden.")
EndIf
