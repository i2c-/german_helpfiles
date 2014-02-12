#include <IE.au3>

; Erstellt ein Browserfenster und stellt jede der m&ouml;glichen Beispielseiten dar.
; Die zur&uuml;ckgegebene Objektvariable kann als Objektvariable behandelt werden, die von _IECreate oder _IEAttach zur&uuml;ckgegeben wurde.

Local $oIE_basic = _IE_Example("basic")
Local $oIE_form = _IE_Example("form")
Local $oIE_table = _IE_Example("table")
Local $oIE_frameset = _IE_Example("frameset")
Local $oIE_iframe = _IE_Example("iframe")
