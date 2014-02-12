#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <TreeViewConstants.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $treeview, $generalitem, $displayitem, $aboutitem, $compitem
	Local $startlabel, $aboutlabel
	Local $compinfo, $togglebutton, $infobutton, $statebutton, $cancelbutton
	Local $msg, $item, $text, $hItem

	GUICreate("Meine GUI mit Treeview", 350, 215)

	$treeview = GUICtrlCreateTreeView(6, 6, 150, 150, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE)
	$generalitem = GUICtrlCreateTreeViewItem("Allgemein", $treeview)
	GUICtrlSetColor(-1, 0x0000C0)
	$displayitem = GUICtrlCreateTreeViewItem("Anzeige", $treeview)
	GUICtrlSetColor(-1, 0x0000C0)
	$aboutitem = GUICtrlCreateTreeViewItem("&Uuml;ber", $generalitem)
	$compitem = GUICtrlCreateTreeViewItem("Computer", $generalitem)
	GUICtrlCreateTreeViewItem("Benutzer", $generalitem)
	GUICtrlCreateTreeViewItem("Aufl&ouml;sung", $displayitem)
	GUICtrlCreateTreeViewItem("Sonstiges", $displayitem)

	$startlabel = GUICtrlCreateLabel("Treeview Demo", 160, 90, 100, 20)
	$aboutlabel = GUICtrlCreateLabel("Dieses kleine Skript demonstriert die Benutzung eines Treeview-Controls.", 160, 70, 150, 60)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "aboutlabel"-Text w&auml;hrend der Initialisierung
	$compinfo = GUICtrlCreateLabel("Name:" & @TAB & @ComputerName & @CRLF & "OS:" & @TAB & @OSVersion & @CRLF & "SP:" & @TAB & @OSServicePack, 160, 30, 200, 80)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "compinfo"-Text w&auml;hrend der Initialisierung

	GUICtrlCreateLabel("", 0, 170, 350, 2, $SS_SUNKEN)
	$togglebutton = GUICtrlCreateButton("&Umschalten", 35, 185, 70, 20)
	$infobutton = GUICtrlCreateButton("&Info", 105, 185, 70, 20)
	$statebutton = GUICtrlCreateButton("Auf/Zu", 175, 185, 70, 20)
	$cancelbutton = GUICtrlCreateButton("&Abbrechen", 245, 185, 70, 20)

	GUICtrlSetState($generalitem, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Allgemein"-Tree und stellt ihn im Stil 'fett' dar
	GUICtrlSetState($displayitem, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Anzeige"-Tree und stellt ihn im Stil 'fett' dar

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $cancelbutton Or $msg = $GUI_EVENT_CLOSE
				ExitLoop

			Case $msg = $togglebutton ; Schriftstil 'fett ein/ausschalten
				If BitAND(GUICtrlRead($generalitem), $GUI_DEFBUTTON) Then
					GUICtrlSetState($generalitem, 0)
					GUICtrlSetState($displayitem, 0)
				Else
					GUICtrlSetState($generalitem, $GUI_DEFBUTTON)
					GUICtrlSetState($displayitem, $GUI_DEFBUTTON)
				EndIf

			Case $msg = $infobutton
				$item = GUICtrlRead($treeview) ; Holt die Control-ID des aktuell gew&auml;hlten Treeview-Items
				If $item = 0 Then
					MsgBox($MB_SYSTEMMODAL, "TreeviewDemo", "Momentan ist kein Eintrag markiert")
				Else
					$text = GUICtrlRead($item, 1) ; Holt den Text des Treeview-Items
					If $text == "" Then
						MsgBox($MB_SYSTEMMODAL, "Fehler", "Fehler w&auml;hrend der Abfrage des Treeview-Items")
					Else
						MsgBox($MB_SYSTEMMODAL, "TreeviewDemo", "Aktuell gew&auml;hltes Item ist: " & $text) ; $advmsg[0] enth&auml;lt den Text und $advmsg[1] den Statuswert des Treeview-Items
					EndIf
				EndIf

			Case $msg = $statebutton ; Expandiert oder versteckt den markierten Tree
				$item = GUICtrlRead($treeview)
				If $item > 0 Then
					$hItem = GUICtrlGetHandle($item)
					DllCall("user32.dll", "int", "SendMessage", "hwnd", GUICtrlGetHandle($treeview), "int", $TVM_EXPAND, "int", $TVE_TOGGLE, "hwnd", $hItem)
				EndIf

				; Die folgenden Items verstecken die anderen Labels (erster und zweiter Parameter) und zeigen anschlie&szlig;end die 'eigenen' Labels (dritter und vierter Parameter)
			Case $msg = $generalitem
				GUIChangeItems($aboutlabel, $compinfo, $startlabel, $startlabel)

			Case $msg = $aboutitem
				GUICtrlSetState($compinfo, $GUI_HIDE)
				GUIChangeItems($startlabel, $startlabel, $aboutlabel, $aboutlabel)

			Case $msg = $compitem
				GUIChangeItems($startlabel, $aboutlabel, $compinfo, $compinfo)
		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func GUIChangeItems($hidestart, $hideend, $showstart, $showend)
	Local $idx

	For $idx = $hidestart To $hideend
		GUICtrlSetState($idx, $GUI_HIDE)
	Next
	For $idx = $showstart To $showend
		GUICtrlSetState($idx, $GUI_SHOW)
	Next
EndFunc   ;==>GUIChangeItems
