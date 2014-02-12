#include <Array.au3>

;===============================================================================
; Beispiel 1
;===============================================================================
Local $asControls = StringSplit(WinGetClassList("[active]", ""), @LF)
_ArrayDisplay($asControls, "Klassenliste des aktiven Fensters")

;===============================================================================
; Beispiel 2 (verwendet ein selbst definiertes Array)
;===============================================================================
Local $avArray[10]

$avArray[0] = "JPM"
$avArray[1] = "Holger"
$avArray[2] = "Jon"
$avArray[3] = "Larry"
$avArray[4] = "Jeremy"
$avArray[5] = "Valik"
$avArray[6] = "Cyberslug"
$avArray[7] = "Nutster"
$avArray[8] = "JdeB"
$avArray[9] = "Tylo"

_ArrayDisplay($avArray, "$avArray wird manuell auf 1D gesetzt")
_ArrayDisplay($avArray, "$avArray wird seitenverkehrt auf 1D gesetzt (Zeile mit Spalte getauscht)", -1, 1)

;===============================================================================
; Beispiel 3 (verwendet ein Array welches durch StringSplit() zur&uuml;ckgegeben wurde)
;===============================================================================
$avArray = StringSplit(WinGetClassList("", ""), @LF)
_ArrayDisplay($avArray, "$avArray mit allen Klassen in den Fenstern")

;===============================================================================
; Beispiel 4 (ein 2D Array)
;===============================================================================
Local $avArray[2][5] = [["JPM", "Holger", "Jon", "Larry", "Jeremy"],["Valik", "Cyberslug", "Nutster", "JdeB", "Tylo"]]
_ArrayDisplay($avArray, "$avArray als 2D Array")
_ArrayDisplay($avArray, "$avArray seitenverkehrt als 2D Array (Zeile mit Spalte getauscht)", -1, 1)
