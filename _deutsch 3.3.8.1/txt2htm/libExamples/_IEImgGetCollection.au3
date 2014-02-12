; *******************************************************
; Beispiel 1 - Erstellt eine Browser-Instanz und l&auml;dt die englische AutoIt Sseite. Der Browser erh&auml;lt einen Bezug
;				zum f&uuml;nften Bild auf der Seite (Merke: das erste Bild hat den Index 0)
;				und stellt Informationen dar&uuml;ber in einer MsgBox dar
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com/")
Local $oImg = _IEImgGetCollection($oIE, 4)
Local $sInfo = "Url: " & $oImg.src & @CR
$sInfo &= "Dateiname: " & $oImg.nameProp & @CR
$sInfo &= "H&ouml;he: " & $oImg.height & @CR
$sInfo &= "Breite: " & $oImg.width & @CR
$sInfo &= "Rand: " & $oImg.border
MsgBox(0, "Infos &uuml;ber das f&uuml;nfte Bild", $sInfo)

; *******************************************************
; Beispiel 2 - Erstellt eine Browser-Instanz und l&auml;dt die englische AutoIt Seite, erfasst alle Bilder
;				und stellt f&uuml;r jedes Bild die Url in einer MsgBox dar
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com/")
Local $oImgs = _IEImgGetCollection($oIE)
Local $iNumImg = @extended
MsgBox(0, "Bild Infos", "Es gibt " & $iNumImg & " Bilder auf der Seite")
For $oImg In $oImgs
	MsgBox(0, "Bild Infos", "Url=" & $oImg.src)
Next
