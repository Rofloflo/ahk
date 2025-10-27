#Requires AutoHotkey v2.0
SendMode 'Input'
;;;;;;;;;;;;;;;;;Gatherer
on := False

F6:: {
 Global on
 If on := !on                                        ; Toggle a variable indicating whether to proceed
  paste(), SoundBeep(1500)                           ; Start by sending a line feed
 Else SetTimer(paste, 0), ToolTip(), SoundBeep(1000) ; If toggle is reset, then disable the timer
}

paste() {                                            ; Timed subroutine can also be called directly
 
;;;;;;;;;;;Script here
 If WinExist('ahk_exe BPSR_STEAM.exe')
	WinActivate ('ahk_exe BPSR_STEAM.exe')
 Sleep 100
 Send '{WheelDown}'
 Sleep 100
 Send 'f'
 Sleep 100
 Send '!{Tab}'
;;;;;;;;;;;Script below
 
 If on {                                             ; If toggle is set,
  SetTimer paste, -1 * wait := Random(38000, 39000)    ;  then call this function again after a random wait
  ToolTip wait
 }
}

;;;;;;;;;;;;;;;;;Autoclicker

auto := False

F7:: {
 Static on := False
 SetTimer () => Click(), 250 * on := !on	;Delay between clicks is in ms
}
