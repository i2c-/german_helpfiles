; *******************************************************
; Beispiel 1 - &Ouml;ffnet das "form" - Beispiel im Standardbrowser.
;              Nun wird ein Klick auf den Submit-Button simuliert, welcher
;              anhand seiner Beschriftung erkannt wurde. Diese Technik
; 			   ist sinnvoll, weil sehr viele Input-Controls &uuml;ber JavaScript gesteuert werden,
;              bei welchen eine standardm&auml;&szlig;ige "onClick" Ereignis&uuml;bergabe mit_IEFormSubmit()
;              nicht immer dass gew&uuml;nschte Ergebnis hervorruft.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oSubmit = _IEGetObjByName($oIE, "submitExample")
_IEAction($oSubmit, "click")
_IELoadWait($oIE)

; *******************************************************
; Beispiel 2 - &Auml;hnlich wie Beispiel 1, nur dass hier dem gew&uuml;nschten Element der Fokus &uuml;bergeben
;              wird und dann &uuml;ber ControlSend() Enter gesendet.
;              Verwende diese Technik, wenn Skripte im Browser verhindern,
;              dass AutoIt das Ende der Aktion mitbekommt und das Skript fortgesetzt wird.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oSubmit = _IEGetObjByName($oIE, "submitExample")
Local $hwnd = _IEPropertyGet($oIE, "hwnd")
_IEAction($oSubmit, "focus")
ControlSend($hwnd, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "{Enter}")

; Wartet bis das Explorerfenster im Vordergrund ist, und klickt dann auf OK.
WinWait("Windows Internet Explorer", "ExampleFormSubmitted")
ControlClick("Windows Internet Explorer", "ExampleFormSubmitted", "[CLASS:Button; TEXT:OK; Instance:1;]")
_IELoadWait($oIE)
