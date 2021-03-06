// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//
// Copyright (C) 1993-1995  Microsoft Corporation.  All Rights Reserved.
//
//  MODULE: printdlg.c
//
//  PURPOSE:
//    To show the use of the "Print" and "Print Setup" common dialog
//    boxes.
//
//  FUNCTIONS:
//    CmdPrint   - Present the print dialog to the user and process 
//                 the results.
//    CmdPrintSU - Present the print setup common dialog to the user.
//
//  COMMENTS:
//
//
//
//  SPECIAL INSTRUCTIONS: N/A
//

#include <windows.h>            // required for all Windows applications
#ifdef WIN16
#include "win16ext.h"           // required only for win16 applications
#include "commdlg.h"           
#endif
#include "globals.h"            // prototypes specific to this application

static HANDLE hDevMode = NULL;
static HANDLE hDevNames = NULL;

//
//  FUNCTION: CmdPrint(HWND, WORD, WORD, HWND)
//
//  PURPOSE: Present the print dialog to the user and process the results.
//
//  PARAMETERS:
//    hwnd     - The window handle.
//    wCommand - IDM_PRINT (Unused)
//    wNotify  - Notification number (unused)
//    hwndCtrl - NULL (Unused)
//
//  RETURN VALUE:
//    Always returns 0 - Command handled.
//
//  COMMENTS:
//
//

LRESULT CmdPrint(HWND hwnd, WORD wCommand, WORD wNotify, HWND hwndCtrl)
{
    PRINTDLG pd = {0};

    static DWORD Flags     = PD_PAGENUMS | PD_SHOWHELP | PD_RETURNDC;
    static WORD  nFromPage = 0xFFFF;
    static WORD  nToPage   = 0xFFFF;
    static WORD  nCopies   = 1;

    DWORD  nPageRange = GetPageRange();

    pd.lStructSize = sizeof(pd);
    pd.hwndOwner   = hwnd;
    pd.hDevMode    = hDevMode;
    pd.hDevNames   = hDevNames;
    pd.Flags       = Flags;
    pd.nFromPage   = nFromPage;
    pd.nToPage     = nToPage;
    pd.nMinPage    = LOWORD(nPageRange);
    pd.nMaxPage    = HIWORD(nPageRange);
    pd.nCopies     = nCopies;

    if (PrintDlg(&pd))
    {
        Print(pd.hDC,
              (BOOL)(pd.Flags & PD_PAGENUMS),
              (BOOL)(pd.Flags & PD_SELECTION),
              (BOOL)(pd.Flags & PD_COLLATE),
              (BOOL)(pd.Flags & PD_PRINTTOFILE),
              pd.nFromPage,
              pd.nToPage,
              pd.nCopies,
              pd.hDevNames);
        hDevMode    = pd.hDevMode;
        hDevNames   = pd.hDevNames;
        Flags       = pd.Flags;
        nFromPage   = pd.nFromPage;
        nToPage     = pd.nToPage;
    }

    return 0;
}


//
//  FUNCTION: CmdPrintSU(HWND, WORD, WORD, HWND)
//
//  PURPOSE: Present the print setup common dialog to the user.
//
//  PARAMETERS:
//    hwnd     - The window handle.
//    wCommand - IDM_PRINTSU (Unused)
//    wNotify   - Notification number (unused)
//    hwndCtrl - NULL (Unused)
//
//  RETURN VALUE:
//    Always returns 0 - Command handled.
//
//  COMMENTS:
//
//

LRESULT CmdPrintSU(HWND hwnd, WORD wCommand, WORD wNotify, HWND hwndCtrl)
{
    PRINTDLG pd = {0};

    pd.lStructSize = sizeof(pd);
    pd.hwndOwner   = hwnd;
    pd.hDevMode    = hDevMode;
    pd.hDevNames   = hDevNames;
    pd.Flags       = PD_SHOWHELP | PD_PRINTSETUP;

    if (PrintDlg(&pd))
    {
        MessageBox(hwnd,
                   "Set up the printer",
                   "Print Setup",
                   MB_ICONINFORMATION|MB_OK);
        hDevMode = pd.hDevMode;
        hDevNames = pd.hDevNames;
    }
    else
    {
        MessageBox(hwnd,
                   "Did not set up the printer",
                   "Print Setup",
                   MB_ICONSTOP|MB_OK);
    }

    return 0;
}
