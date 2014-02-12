#include <Misc.au3>
If _Singleton("Skript", 1) = 0 Then
	MsgBox(0, "Warnung", "Eine Instanz des Skripts wird bereits ausgef&uuml;hrt!")
	Exit
EndIf
MsgBox(0, "Alles i.O.", "Die erste Instanz des Skripts l&auml;uft.")
