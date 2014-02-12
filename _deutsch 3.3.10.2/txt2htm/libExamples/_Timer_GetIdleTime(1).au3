#include <Timers.au3>
#include <MsgBoxConstants.au3>
SplashTextOn("_Timer_GetIdleTime-Beispiel", "Bitte 10 Sekunden warten...", 300, 50, -1, -1, 34, '', 14, 800)

; Maus- oder Tastaturaktionen w&auml;hrend dieser 10 Sekunden beeinflussen die berichtete Leerlaufzeit
Sleep(10 * 1000); 10sec
SplashOff()

Global $iIdleTime = _Timer_GetIdleTime()

MsgBox($MB_SYSTEMMODAL, "_Timer_GetIdleTime", "Leerlaufzeit = " & $iIdleTime & "ms")
