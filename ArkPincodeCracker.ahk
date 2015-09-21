/**
 * @Author: Stuart Bannerman
 * @Date:   2015-08-17 10:05:03
 * @Last Modified by: Stuart Bannerman
 * @Last Modified time: 2015-09-20 82:15:12
 * @Repository: https://github.com/m3talstorm/ArkPincodeCracker
 * @License: MIT
 * @Description: A bot written in AutoHotKey to brute force the pin code locks in ARK: Survival Evolved
 */


; Standard keybinds
+^R::Reload      ; Reloads Script: Control + Shift + R
+^P::Pause       ; (Un)Pauses  Script: Control + Shift + P
Ins::Suspend     ; Suspend Script: Insert
Esc::ExitApp     ; Exit the Script: Escape


; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv
; Stop multiple bots from running
#SingleInstance force
; Recommended for new scripts due to its superior speed and reliability.
SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%
; Speed up script execution...hopefully: http://ahkscript.org/docs/commands/SetBatchLines.htm
SetBatchLines -1

; Outputs a value to a log file
Log(value)
{
    FileAppend,
    (

    %value%
    ), attempts.log
}

; Tries a pin code
Attempt(code)
{
    ; So the user knows what is being typed for them
    ToolTip %code%
    ; Open up the pin code window
    SendInput, e
    ; Wait for the window to 'load'
    Sleep, 650
    ; Simulate key presses of typing in the code
    SendInput, %code%
    ; Log the code that was tried
    Log(code)
    ; Wait for the window to close
    Sleep, 600

    return
}

; Ctrl + Shift + Left mouse button
+^LButton::

    ; Ask the user where they want to start from and now many codes to try, as well as if they want to try the common pin codes first
    InputBox, start, The pin code to start at
    InputBox, amount, The amout of pin codes to go through
    MsgBox, 4, , Include common pin codes?

    ; Common pin codes
    IfMsgBox, Yes
    {
        Log("================================= Common ============================================")

        common := ["0000", "1111", "2222", "3333", "4444", "5555", "6666", "7777", "8888", "9999", "1010", "2020", "3030", "4040", "5050", "6060", "7070", "8080", "9090", "4321", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000"]

        For key, code in common
        {
            Attempt(code)
        }
    }

    Log("================================= All ============================================")

    while start <= amount
    {
        ; Pad the number with zeros if we need to
        code = % SubStr("0000" start, -3)
        ; Try the code
        Attempt(code)
        ; Onto the next
        start++
    }
    ; Finished, clear the tooltip
    ToolTip


Return


