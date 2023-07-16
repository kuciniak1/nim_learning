# Simple code to spawn a notepad process using the WinAPI

import strformat
import winim

var process: WINBOOL
var ProcessInformation: PROCESS_INFORMATION
var program = "C:\\Windows\\System32\\notepad.exe"
var StartUpInfo: STARTUPINFOW

echo &"(?) Creating process with {program}..."

process = CreateProcessW(
    program,
    NULL,
    NULL,
    NULL,
    FALSE,
    NORMAL_PRIORITY_CLASS,
    NULL,
    NULL,
    addr StartUpInfo,
    addr ProcessInformation
)

if (process == 0):
    echo &"(-) Failed to create a process, error code: {GetLastError()}"
    quit(1)

echo &"(+) Process created sucessfullly, PID: {ProcessInformation.dwProcessId}" 

quit(0)
