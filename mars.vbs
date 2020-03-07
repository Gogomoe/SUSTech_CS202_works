dim objShell
set objShell=wscript.createObject("WScript.Shell")
iReturnCode=objShell.Run("java -jar Mars4_5.jar",0,TRUE)