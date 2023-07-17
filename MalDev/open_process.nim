# Simple code to open and close a process
# Monitoring the process with Process Explorer will show that the process is closed

import os
import strformat
import strutils
import winim

if (paramCount() != 1):
    echo &"(-) Usage: {paramStr(0)} <PID>"
    quit(1)

var close_handle_status:WINBOOL
var pid:int  
var process:HANDLE
var terminate_process_status:WINBOOL

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

echo &"(?) Terminating the process with PID = {pid}..."

terminate_process_status = TerminateProcess(process, 0)

if (terminate_process_status == 0):
    echo &"(-) Failed to terminate the process, error code: {GetLastError()}"
    quit(1)

echo &"(+) Process closed sucessfully"

echo &"(?) Closing the process handle..."

close_handle_status = CloseHandle(process)

if (close_handle_status == 0):
    echo &"(-) Failed to close the process handle, error code: {GetLastError()}"
    quit(1)

echo &"(+) Handle closed sucessfully"

quit(0)
