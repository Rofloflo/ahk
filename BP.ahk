#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Declare variables to use in the script
; Track your hotkey toggle
toggle	:= 0
; Set what you want your minimum time to be
minTime	:= 38000
; Set what you want your maximum time to be
maxTime	:= 39000
return

DetectHiddenWindows, On
SetTitleMatchMode, 2
; Assign a hotkey to toggle your function on and off


F6::
	; Toggle your variable
	toggle := !toggle

	; If toggle is on/1/true, start the ClickSub timer
	if (toggle = 1)
		SetTimer, ClickSub, -1
	; If toggle is off/0/false, turn the ClickSub timer off
	Else
		SetTimer, ClickSub, Off
return

; Block of code you want to run each time
ClickSub:
	If WinExist ahk_exe BPSR_STEAM.exe
	WinWait ahk_exe BPSR_STEAM.exe
	WinActivate ahk_exe BPSR_STEAM.exe
	Sleep 100
		; Send your click event
		Send {WheelDown}
		Sleep 100
		Send f
		; Have AHK generate a random number between your min and max time
		Random, randTime, % minTime, % maxTime
		
		; Use the random number to start a new timer
		SetTimer, ClickSub, % -randTime
		Sleep 100
	Send !{Tab}
return


#MaxThreadsPerHotkey 2
F7::
on := !on
loop
{
	If not on
		break
	MouseClick
	Sleep 250
}
return
