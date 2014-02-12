#include <MsgBoxConstants.au3>

If ProcessExists("SciTE.exe") = 0 Then
	MsgBox($MB_SYSTEMMODAL, "", "Es wird die SciTE.exe ben&ouml;tigt, damit in der Konsole die Meldungen gelesen werden k&ouml;nnen.")
EndIf

Example()

Func Example()
	; Registriert die Funktion MyAdLibFunc(), welche alle 250ms aufgerufen wird (Standard).
	AdlibRegister("MyAdLibFunc")

	; Trotz der Pause l&auml;uft die AdLib Funktion weiter.
	Sleep(1000)

	; AdLib Funktionen laufen nicht w&auml;hrend eine blockierende Funktion wie z. B. MsgBox, InputBox, WinWait, WinWaitClose, usw. gezeigt wird.
	MsgBox($MB_SYSTEMMODAL, "", "Es wird keine Meldung in der Konsole gezeigt w&auml;hrend das Nachrichtenfenster angezeigt wird.")

	; Die AdLib Funktion MyAdLibFunc() beginnt erneut.
	Sleep(2000)

	; Deregistriert die Funktion MyAdLibFunc(), welche alle 250ms aufgerufen wird (Standard).
	AdlibUnRegister("MyAdLibFunc")
EndFunc   ;==>Example

Func MyAdLibFunc()
	; Weist eine statischen Variable zu um die Anzalh der Funktionsaufrufe festzuhalten.
	Local Static $iCount = 0
	$iCount += 1

	ConsoleWrite("MyAdLibFunc wurde " & $iCount & " mal aufgerufen" & @CRLF)
EndFunc   ;==>MyAdLibFunc
