; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem Formular-Beispiel und &auml;ndert den Wert eines Textfeldes
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! Es funktioniert!")

; *******************************************************
; Beispiel 2 - Stellt den Verweis auf ein bestimmtes Formular-Feld fest und &auml;ndert seinen Wert.
;				Anschlie&szlig;end wird eine Abfrage in der Google Suchmaschine gestartet
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; Beispiel 3 - Setzt den Wert eines Elements vom Typ INPUT TYPE=FILE durch die Verwendung von Send()
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oInputFile = _IEFormElementGetObjByName($oForm, "textExample")

; Setzt den Eingabefokus auf das Feld und sendet dann den Textstring
_IEAction($oInputFile, "focus")

; Markiert den bereits enthaltenen Inhalt, so dass dieser &uuml;berschrieben wird.
_IEAction($oInputFile, "selectall")

Send("Es funktioniert")

; *******************************************************
; Beispiel 4 - Setzt den Wert eines Elements vom Typ INPUT TYPE=FILE
;				Dasselbe wie das vorherige Beispiel, aber mit einem unsichtbarem Fenster
;				(Sicherheitsbeschr&auml;nkungen verhindern die Verwendung von _IEFormElementSetValue)
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")

; Versteckt das Browser-Fenster, um das Senden von Text zu einem versteckten Fenster zu demonstrieren
_IEAction($oIE, "invisible")

$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oInputFile = _IEFormElementGetObjByName($oForm, "fileExample")

; Setzt den Fokus auf das Input-Control und sendet dann den Textstring
_IEAction($oInputFile, "focus")

; Markiert den bereits enthaltenen Inhalt, so dass dieser &uuml;berschrieben wird.
_IEAction($oInputFile, "selectall")

; Ermittelt ein Handle zu dem IE-Fenster
Local $hIE = _IEPropertyGet($oIE, "hwnd")
ControlSend($hIE, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "Es funktioniert")

MsgBox(0, "Erfolg", "Wert gesetzt auf 'Es funktioniert'")
_IEAction($oIE, "visible")
