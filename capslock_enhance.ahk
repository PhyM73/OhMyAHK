#Requires AutoHotkey v2.0
; Enhance the CapsLock key

; - Act as the Esc key if the CapsLock key is pressed alone.
; - Change the CapsLock status if CapsLock+Esc are pressed. The CapsLock key needs to be pressed first,
;   the release order doesn't matter.
; - Act as Control key if the CapsLock is pressed with another key.

; Ensure CapsLock is always off initially
SetCapsLockState("AlwaysOff")

Escape Up:: {
    if GetKeyState("CapsLock", "P") {
        SetCapsLockState(GetKeyState("CapsLock", "T") ? "AlwaysOff" : "AlwaysOn")
    } else {
        Send("{Escape Up}")
    }
    return
}

CapsLock:: Send("{LControl Down}")

CapsLock Up:: {
    if GetKeyState("Escape", "P") {
        Send("{LControl Up}")
        SetCapsLockState(GetKeyState("CapsLock", "T") ? "AlwaysOff" : "AlwaysOn")
    } else if A_PriorKey == "CapsLock" {
        Send("{LControl Up}")
        Send("{Escape}")
    }
    else {
        Send("{LControl Up}")
    } 
    return
}