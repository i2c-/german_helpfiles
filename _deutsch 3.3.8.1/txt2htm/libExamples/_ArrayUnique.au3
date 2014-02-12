; *****************************************************************************
; Beispiel 1 - Deklariert ein 1-dimensionales Array, welches doppelte Werte enth&auml;lt.
; Verwende _ArrayUnique, um ein neues Array zu erstellen, welches jeden Wert maximal einmal enth&auml;lt.
; *****************************************************************************

#include <Array.au3>

Local $aArray[10] = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
_ArrayDisplay($aArray, "$aArray")
Local $aNewArray = _ArrayUnique($aArray) ; Standardparameter verwenden
_ArrayDisplay($aNewArray, "$aNewArray zeigt die erste Dimension von $aArray")

; ******************************************************************************************
; Beispiel 2 - Deklariert ein 2-dimensionales Array, welches doppelte Werte enth&auml;lt.
; Verwende _ArrayUnique, um ein neues Array zu erstellen, welches jeden Wert maximal einmal enth&auml;lt.
; ******************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "A"],[2, "B"],[3, "C"],[1, "A"],[2, "B"],[3, "C"]]
_ArrayDisplay($aArray, "$aArray")
$aNewArray = _ArrayUnique($aArray) ; Standardparameter verwenden
_ArrayDisplay($aNewArray, "$aNewArray zeigt die erste Dimension von $aArray")

$aNewArray = _ArrayUnique($aArray, 2) ; Verwendet die zweite Dimension
_ArrayDisplay($aNewArray, "$aNewArray zeigt die zweite Dimension von $aArray")

; *****************************************************************************************
; Beispiel 3 - Deklariert ein 1-dimensionales Array, welches doppelte Werte enth&auml;lt.
; Verwende _ArrayUnique und die Gro&szlig;- und Kleinschreibung, um ein neues Array zu erstellen, welches jeden Wert maximal einmal enth&auml;lt.
; *****************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "A"],[2, "B"],[3, "C"],[1, "a"],[2, "b"],[3, "c"]]
_ArrayDisplay($aArray, "$aArray")
$aNewArray = _ArrayUnique($aArray, 1, 0, 1) ; Standardparameter mit Gro&szlig;- und Kleinschreibung verwenden
_ArrayDisplay($aNewArray, "$aNewArray zeigt die erste Dimension von $aArray")

$aNewArray = _ArrayUnique($aArray, 2, 0, 1) ; Standardparameter mit Gro&szlig;- und Kleinschreibung verwenden
_ArrayDisplay($aNewArray, "$aNewArray zeigt die zweite Dimension von $aArray")

; *****************************************************************************************
; Beispiel 4 - Deklariert ein 1-dimensionales Array, welches doppelte Werte und "|" enth&auml;lt.
; Verwende _ArrayUnique, um ein neues Array zu erstellen, welches jeden Wert maximal einmal enth&auml;lt.
; *****************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "|A"],[2, "B"],[3, "C"],[1, "|A"],[2, "B"],[3, "C"]]
Local $sMsgBox

$aNewArray = _ArrayUnique($aArray, 2) ; Verwendet die zweite Dimension

For $i = 0 To $aNewArray[0]
	$sMsgBox &= "[" & $i & "]: " & $aNewArray[$i] & @CRLF
Next

; Es m&uuml;ssen Parameter ver&auml;ndert werden, um ein Element anzuzeigen, welches ein "|" in _ArrayDisplay enth&auml;lt
_ArrayDisplay($aNewArray, "$aNewArray zeigt die erste Dimension von $aArray", -1, 0, "@")
