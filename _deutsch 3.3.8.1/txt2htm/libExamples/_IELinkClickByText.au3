; *******************************************************
; Beispiel 1 - &Ouml;ffnet Browser mit basic-Beispiel, klickt auf den Link
;				mit dem Text "user forum"
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IELinkClickByText($oIE, "user forum")

; *******************************************************
; Beispiel 2 -  &Ouml;ffnet Browser mit der AutoIt-Startseite, durchsucht alle Links
;				auf der Seite und klickt auf den Link mit dem Text "wallpaper"
;				durch einen Abgleich des Teilstrings.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

Local $sMyString = "wallpaper"
Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkText = _IEPropertyGet($oLink, "innerText")
	If StringInStr($sLinkText, $sMyString) Then
		_IEAction($oLink, "click")
		ExitLoop
	EndIf
Next
