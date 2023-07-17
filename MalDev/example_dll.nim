import winim
proc create_messagebox(): void {.stdcall,exportc,dynlib.} =
    MessageBoxW(
      cast[HWND](NULL),
      "content",
      "title",
      MB_YESNO or MB_ICONERROR
    )