#include <Process.au3>
#include <MsgBoxConstants.au3>

Local $i_Priority_Level, $i_Notepad_PID, $i_ArrayItem
Local $a_RunLevels[3] = [0, 2, 4] ; Niedrige, normale, h&ouml;here Priorit&auml;t

; Ermittelt das Priorit&auml;tslevel dieser Instanz von AutoIt
$i_Priority_Level = _ProcessGetPriority(@AutoItPID)
MsgBox($MB_SYSTEMMODAL, "AutoIt Skript", "Priorit&auml;t sollte 2 sein: " & $i_Priority_Level)

$i_Notepad_PID = Run('notepad.exe')

WinWaitActive("Unbenannt", "", 3)
For $i_ArrayItem = 0 To 2
	ProcessSetPriority($i_Notepad_PID, $a_RunLevels[$i_ArrayItem])
	$i_Priority_Level = _ProcessGetPriority($i_Notepad_PID)
	MsgBox($MB_SYSTEMMODAL, "Notepad Priorit&auml;t", "Sollte " & $a_RunLevels[$i_ArrayItem] & " sein" & ": " & $i_Priority_Level)
Next

ProcessClose("notepad.exe")
