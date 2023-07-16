# Simple code to spawn a message box with a title and content with WInAPI

import os
import strformat
import winim

if (paramCount() != 2):
    echo &"(-) Usage: {paramStr(0)} <Title of the message box> <Content of the message box>"
    quit(1)

var title:LPCWSTR = paramStr(1)
var content:LPCWSTR = paramStr(2)

MessageBoxW(
    cast[HWND](NULL),
    content,
    title,
    MB_YESNO or MB_ICONERROR
)

quit(0)
