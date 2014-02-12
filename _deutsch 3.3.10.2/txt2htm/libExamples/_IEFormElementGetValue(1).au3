#include <IE.au3>
#include <MsgBoxConstants.au3>

;&Ouml;ffnet eine Browser-Instanz mit dem Formularelement-Beispiel, setzt den Wert eines Text-Formularelements, ruft den Wert von dem Formularelement ab und zeigt den Wert an.

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
Local $IEAu3Version = _IE_VersionInfo()
_IEFormElementSetValue($oText, $IEAu3Version[5])
MsgBox($MB_SYSTEMMODAL, "Formularelement Wert", _IEFormElementGetValue($oText))

_IEQuit($oIE)
