#include <IE.au3>
#include <MsgBoxConstants.au3>

; Erstellt eine Browser-Instanz und l&auml;dt die englische AutoIt Sseite.
; Der Browser erh&auml;lt einen Bezug zum f&uuml;nften Bild auf der Seite (Merke: das erste Bild hat den Index 0) und stellt Informationen dar&uuml;ber in einer MsgBox dar

Local $oIE = _IECreate("http://www.autoitscript.com/")
Local $oImg = _IEImgGetCollection($oIE, 4)
Local $sInfo = "Url: " & $oImg.src & @CRLF
$sInfo &= "Dateiname: " & $oImg.nameProp & @CRLF
$sInfo &= "H&ouml;he: " & $oImg.height & @CRLF
$sInfo &= "Breite: " & $oImg.width & @CRLF
$sInfo &= "Rand: " & $oImg.border
MsgBox($MB_SYSTEMMODAL, "Infos &uuml;ber das f&uuml;nfte Bild", $sInfo)

_IEQuit($oIE)
