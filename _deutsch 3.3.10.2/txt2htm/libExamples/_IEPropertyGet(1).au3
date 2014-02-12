#include <IE.au3>
#include <MsgBoxConstants.au3>

; &Ouml;ffnet eine Browser-Instanz mit dem Grundbeispiel, pr&uuml;ft ob die Adressleiste sichtbar ist. Falls sie sichtbar ist wird sie versteckt und umgekehrt.

Local $oIE = _IE_Example("basic")
If _IEPropertyGet($oIE, "addressbar") Then
	MsgBox($MB_SYSTEMMODAL, "Adressleiste Status", "Adressleiste sichtbar, verstecken der Adressleiste")
	_IEPropertySet($oIE, "addressbar", False)
Else
	MsgBox($MB_SYSTEMMODAL, "Adressleiste Status", "Adressleiste versteckt, einblenden der Adressleiste")
	_IEPropertySet($oIE, "addressbar", True)
EndIf
