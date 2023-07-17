# Simple code to open and close a process
# Monitoring the process with Process Explorer will show that the process is closed

import os
import strformat
import strutils
import winim

if (paramCount() != 1):
    echo &"(-) Usage: {paramStr(0)} <PID>"
    quit(1)

var closed:WINBOOL
var pid:int  
var process:HANDLE

pid = paramStr(1).parseInt()

if (pid == 0):
    echo &"(-) Invalid PID"
    quit(1)

echo &"(?) Opening a process with PID = {pid}..."

process = OpenProcess(
    PROCESS_ALL_ACCESS,
    FALSE,
    cast[DWORD](pid)
);

if (process == 0):
    echo &"(-) Failed to open a process with PID = {pid}, error code: {GetLastError()}"
    quit(1)

echo &"(+) Process opened sucessfully, handle: {process}, PID: {GetProcessId(process)}, priority: {GetPriorityClass(process)}"

echo &"(?) Closing the process with PID = {pid}..."

closed = TerminateProcess(process, 0)

if (closed == 0):
    echo &"(-) Failed to close the process, error code: {GetLastError()}"
    quit(1)

CloseHandle(process)

echo &"(+) Process closed sucessfully"

quit(0)
