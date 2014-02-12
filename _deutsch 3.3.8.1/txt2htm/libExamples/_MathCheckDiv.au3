#include <math.au3>

Local $I_Var = InputBox('ungerade oder gerade', 'Eine Zahl eingeben:')
Local $I_Result = _MathCheckDiv($I_Var, 2)
If $I_Result = -1 Or @error = 1 Then
	MsgBox(0, '', 'Es wurde eine ung&uuml;ltige Zahl eingegeben')
ElseIf $I_Result = 1 Then
	MsgBox(0, '', 'Zahl ist ungerade')
ElseIf $I_Result = 2 Then
	MsgBox(0, '', 'Zahl ist gerade')
Else
	MsgBox(0, '', '$I_Result konnte nicht analysiert werden')
EndIf
