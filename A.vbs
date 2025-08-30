do

Set wshshell = wscript.CreateObject("WScript.Shell")

Wshshell.run "Notepad"

wscript.sleep 100

wshshell.sendkeys "N"

wscript.sleep 100

wshshell.sendkeys "O"

wscript.sleep 100

wshshell.sendkeys "N"

wscript.sleep 100

wshshell.sendkeys "O"

wscript.sleep 100

wshshell.sendkeys "N"


loop