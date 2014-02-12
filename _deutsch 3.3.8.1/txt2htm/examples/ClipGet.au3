Local $bak = ClipGet()
MsgBox(0, "Zwischenablage enth&auml;lt:", $bak)

ClipPut($bak & "zus&auml;tzlicher Text")
MsgBox(0, "Zwischenablage enth&auml;lt:", ClipGet())
