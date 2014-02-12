#include <File.au3>

Example()

Func Example()
	Local $from, $to, $path
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir")

	$from = @ScriptDir
	ConsoleWrite("Quellpfad: " & $from & @CRLF)
	$to = $sFile & "\autoit3.exe"
	ConsoleWrite("Zielpfad: " & $to & @CRLF)
	$path = _PathGetRelative($from, $to)
	If @error Then
		ConsoleWrite("Fehler: " & @error & @CRLF)
		ConsoleWrite("Pfad: " & $path & @CRLF)
	Else
		ConsoleWrite("Relativer Pfad: " & $path & @CRLF)
		ConsoleWrite("Aufgel&ouml;ster Pfad: " & _PathFull($from & "\" & $path) & @CRLF)
	EndIf
EndFunc   ;==>Example
