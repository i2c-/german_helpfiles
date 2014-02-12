#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "PathFindOnPath Beispiel", _
		StringFormat("Vollst&auml;ndiger Pfad zur Datei notepad.exe:\n%s\n\n" & _
		"Findet die ntuser.dat im Profilordner,  benutzt benutzerdefinierte Pfade:\n%s", _
		_WinAPI_PathFindOnPath("notepad.exe"), _WinAPI_PathFindOnPath("ntuser.dat", @UserProfileDir) _
		))
