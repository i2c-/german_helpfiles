#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WindowsConstants.au3>

Global $iMemo, $aEncoder, $hImage

_Main()

Func _Main()
	Local $hBitmap

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt ein Bild f&uuml;r die Parameteranzeige
	$hBitmap = _ScreenCapture_Capture("", 0, 0, 1, 1)
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Zeigt Encoder-Parameter
	$aEncoder = _GDIPlus_Encoders()
	ShowEncoder("Encoder")

	; Zeigt Decoder-Parameter
	$aEncoder = _GDIPlus_Decoders()
	ShowEncoder("Decoder")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Zeigt Encoder-Informationen
Func ShowEncoder($sTitle)
	Local $iI, $iJ, $iK, $sCLSID, $tData, $tParam, $tParams

	For $iI = 1 To $aEncoder[0][0]
		$sCLSID = _GDIPlus_EncodersGetCLSID($aEncoder[$iI][5])
		MemoWrite("Bild " & $sTitle & " " & $iI)
		MemoWrite("  Codec GUID ............: " & $aEncoder[$iI][1])
		MemoWrite("  Dateiformat GUID ......: " & $aEncoder[$iI][2])
		MemoWrite("  Codec-Name ............: " & $aEncoder[$iI][3])
		MemoWrite("  Codec-Dll Dateiname ...: " & $aEncoder[$iI][4])
		MemoWrite("  Codec-Dateiformat .....: " & $aEncoder[$iI][5])
		MemoWrite("  Dateierweiterung ......: " & $aEncoder[$iI][6])
		MemoWrite("  Mime-Typ ..............: " & $aEncoder[$iI][7])
		MemoWrite("  Flags .................: 0x" & Hex($aEncoder[$iI][8]))
		MemoWrite("  Version ...............: " & $aEncoder[$iI][9])
		MemoWrite("  Signaturz&auml;hler ........: " & $aEncoder[$iI][10])
		MemoWrite("  Signaturgr&ouml;&szlig;e .........: " & $aEncoder[$iI][11])
		MemoWrite("  Signaturmuster-Zeiger .: 0x" & Hex($aEncoder[$iI][12]))
		MemoWrite("  Signaturmasken-Zeiger .: 0x" & Hex($aEncoder[$iI][13]))
		MemoWrite("  Parameterlistengr&ouml;&szlig;e...: " & _GDIPlus_EncodersGetParamListSize($hImage, $sCLSID))
		MemoWrite()

		$tParams = _GDIPlus_EncodersGetParamList($hImage, $sCLSID)
		If @error Then ContinueLoop

		For $iJ = 0 To DllStructGetData($tParams, "Count") - 1
			MemoWrite("  Bild " & $sTitle & " Parameter " & $iJ)
			$tParam = DllStructCreate($tagGDIPENCODERPARAM, DllStructGetPtr($tParams, "Params") + ($iJ * 28))
			MemoWrite("    Parameter GUID ......: " & _WinAPI_StringFromGUID(DllStructGetPtr($tParam, "GUID")))
			MemoWrite("    Anzahl der Werte ....: " & DllStructGetData($tParam, "Count"))
			MemoWrite("    Parametertyp ........: " & DllStructGetData($tParam, "Type"))
			MemoWrite("    Parameterzeiger .....: 0x" & Hex(DllStructGetData($tParam, "Values")))
			Switch DllStructGetData($tParam, "Type")
				Case 4
					$tData = DllStructCreate("int Data[" & DllStructGetData($tParam, "Count") & "]", DllStructGetData($tParam, "Values"))
					For $iK = 1 To DllStructGetData($tParam, "Count")
						MemoWrite("      Wert ..............: " & DllStructGetData($tData, 1, $iK))
					Next
				Case 6
					$tData = DllStructCreate("int Low;int High", DllStructGetData($tParam, "Values"))
					MemoWrite("      Bereichsanfang ....: " & DllStructGetData($tData, "Low"))
					MemoWrite("      Bereichsende ......: " & DllStructGetData($tData, "High"))
			EndSwitch
			MemoWrite()
		Next
	Next
EndFunc   ;==>ShowEncoder
