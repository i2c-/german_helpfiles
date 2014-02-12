; Wartet bis kein Prozess mehr von notepad.exe existiert
ProcessWaitClose("notepad.exe")

; Dies wartet, bis der spezielle Prozess ($PID) von der notepad.exe nicht mehr existiert
Local $PID = Run("notepad.exe")
ProcessWaitClose($PID)
