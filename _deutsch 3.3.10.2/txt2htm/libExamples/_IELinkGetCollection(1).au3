#include <IE.au3>
#include <MsgBoxConstants.au3>

; &Ouml;ffnet den Browser mit dem Grundbeispiel und erh&auml;lt eine Verbindung zur Sammlung, durchl&auml;uft die einzelnen Eintr&auml;ge und zeigt die damit verbundenen URLs Referenzen

Local $oIE = _IE_Example("basic")
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended
Local $sTxt = $iNumLinks & " Links gefunden" & @CRLF & @CRLF
For $oLink In $oLinks
	$sTxt &= $oLink.href & @CRLF
Next
MsgBox($MB_SYSTEMMODAL, "Link Info", $sTxt)
