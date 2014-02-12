Local $result = StringInStr("Ich bin ein String", "RING")
MsgBox(0, "Suchergebnis:", $result)

Local $location = StringInStr("How much wood could a woodchuck chuck is a woodchuck could chuck wood?", "wood", 0, 3) ; Findet das 3. Auftreten von "wood"
