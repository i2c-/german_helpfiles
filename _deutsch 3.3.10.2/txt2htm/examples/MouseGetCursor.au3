#include <MsgBoxConstants.au3>

Sleep(1000) ; Zeit, um die Maus zu bewegen, bevor die ID abgefragt wird

; Erstellt durch die Verwendung von StringSplit ein Array mit einer Zuordnung zwischen der Zeigerart und der ID Nummer
Local $aArray = StringSplit("Unknown|AppStarting|Arrow|Cross|Help|IBeam|Icon|No|" & _
		"Size|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait|Hand", "|", 2) ; Der flag Parameter ist auf das flag = 2 gesetzt, da die Gesamtzahl der Elemente im Array nicht ben&ouml;tigt wird.
#cs
	Das zur&uuml;ckgegebene Array wird folgende Werte enthalten:
	$aArray[0] = "Unknown"
	$aArray[1] = "AppStarting"
	$aArray[2] = "Arrow"
	...
	$aArray[16] = "Hand"
#ce

Local $iCursor = MouseGetCursor()
MsgBox($MB_SYSTEMMODAL, "CursorID = " & $iCursor, "Dieses bedeutet: " & $aArray[$iCursor] & ".") ; Es ist die CursorID Wert wie der Indexwert des Arrays zu verwenden
