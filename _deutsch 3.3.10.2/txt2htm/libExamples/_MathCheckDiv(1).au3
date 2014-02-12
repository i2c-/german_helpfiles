#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $I_Var = InputBox('ungerade oder gerade', 'Eine Zahl eingeben:')
Local $I_Result = _MathCheckDiv($I_Var, 2)
If $I_Result = -1 Or @error = 1 Then
	MsgBox($MB_SYSTEMMODAL, '', 'Es wurde eine ung&uuml;ltige Zahl eingegeben')
ElseIf $I_Result = 1 Then
	MsgBox($MB_SYSTEMMODAL, '', 'Zahl ist ungerade')
ElseIf $I_Result = 2 Then
	MsgBox($MB_SYSTEMMODAL, '', 'Zahl ist gerade')
Else
	MsgBox($MB_SYSTEMMODAL, '', '$I_Result konnte nicht analysiert werden')
EndIf
