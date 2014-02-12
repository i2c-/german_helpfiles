#include <Misc.au3>
#include <MsgBoxConstants.au3>

If _Singleton("Skript", 1) = 0 Then
	MsgBox($MB_SYSTEMMODAL, "Warnung", "Eine Instanz des Skripts wird bereits ausgef&uuml;hrt!")
	Exit
EndIf
MsgBox($MB_SYSTEMMODAL, "Alles i.O.", "Die erste Instanz des Skripts l&auml;uft.")
