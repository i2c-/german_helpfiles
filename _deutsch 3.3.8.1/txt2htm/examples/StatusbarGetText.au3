AutoItSetOption("WinTitleMatchMode", 2)
Local $x = StatusbarGetText("Internet Explorer")
MsgBox(0, "Die Statusbar des Internet Explorer beinhaltet:", $x)
