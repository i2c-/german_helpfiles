; *******************************************************
; Beispiel 1 - Erstellt ein leeres Wordfenster und f&uuml;gt ein neues leeres Dokument hinzu
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate("")
Local $oDoc = _WordDocAdd($oWordApp)
