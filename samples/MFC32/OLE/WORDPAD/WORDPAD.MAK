ORIGIN		= Symantec C++
ORIGIN_VER	= Version 7.22
VERSION		= DEBUG

!IFDEF SUB_DEBUG
DEBUG		= $(SUB_DEBUG)
NDEBUG		= !$(SUB_DEBUG)
!ELSE
DEBUG		= 1
NDEBUG		= 0
!ENDIF

PROJ		= WORDPAD
APPTYPE		= WIN32 EXE
PROJTYPE	= EXE

CC		= SC
CPP		= SPP
JAVAC		= sj
MAKE		= SMAKE
RC		= RCC
HC		= HC31
ASM		= SC
DISASM		= OBJ2ASM
LNK		= LINK
DLLS		= 

HEADERS		= stdafx.h ..\..\..\..\MFC\include\afxwin.h ..\..\..\..\MFC\include\32-bit\afxwin.h  \
		..\..\..\..\MFC\include\afx.h ..\..\..\..\MFC\include\32-bit\afx.h ..\..\..\..\MFC\include\afxver_.h ..\..\..\..\MFC\include\32-bit\afxver_.h  \
		..\..\..\..\MFC\include\afxv_w32.h ..\..\..\..\MFC\include\32-bit\afxv_w32.h ..\..\..\..\include\windows.h ..\..\..\..\include\win32\scdefs.h  \
		..\..\..\..\include\win32\WINDOWS.H ..\..\..\..\include\excpt.h ..\..\..\..\include\stdarg.h ..\..\..\..\include\windef.h  \
		..\..\..\..\include\win32\WINDEF.H ..\..\..\..\include\winnt.h ..\..\..\..\include\win32\WINNT.H ..\..\..\..\include\ctype.h  \
		..\..\..\..\include\pshpack4.h ..\..\..\..\include\win32\pshpack4.h ..\..\..\..\include\poppack.h ..\..\..\..\include\win32\poppack.h  \
		..\..\..\..\include\win32\pshpack2.h ..\..\..\..\include\string.h ..\..\..\..\include\winbase.h ..\..\..\..\include\win32\WINBASE.H  \
		..\..\..\..\include\winerror.h ..\..\..\..\include\win32\WINERROR.H ..\..\..\..\include\wingdi.h ..\..\..\..\include\win32\WINGDI.H  \
		..\..\..\..\include\pshpack1.h ..\..\..\..\include\win32\pshpack1.h ..\..\..\..\include\pshpack2.h ..\..\..\..\include\winuser.h  \
		..\..\..\..\include\win32\WINUSER.H ..\..\..\..\include\winnls.h ..\..\..\..\include\win32\WINNLS.H ..\..\..\..\include\wincon.h  \
		..\..\..\..\include\win32\WINCON.H ..\..\..\..\include\winver.h ..\..\..\..\include\win32\WINVER.H ..\..\..\..\include\winreg.h  \
		..\..\..\..\include\win32\WINREG.H ..\..\..\..\include\winnetwk.h ..\..\..\..\include\win32\WINNETWK.H ..\..\..\..\include\commctrl.h  \
		..\..\..\..\include\win32\COMMCTRL.H ..\..\..\..\include\prsht.h ..\..\..\..\include\win32\PRSHT.H ..\..\..\..\include\tchar.h  \
		..\..\..\..\include\mbstring.h ..\..\..\..\include\mbctype.h ..\..\..\..\mfc\include\afxv_dll.h ..\..\..\..\mfc\include\32-bit\afxv_dll.h  \
		..\..\..\..\include\stdio.h ..\..\..\..\include\stdlib.h ..\..\..\..\include\time.h ..\..\..\..\include\limits.h  \
		..\..\..\..\include\stddef.h ..\..\..\..\include\crtdbg.h ..\..\..\..\mfc\include\afxcoll.h ..\..\..\..\mfc\include\32-bit\afxcoll.h  \
		..\..\..\..\mfc\include\afxstat_.h ..\..\..\..\mfc\include\32-bit\afxstat_.h ..\..\..\..\mfc\include\afxtls_.h ..\..\..\..\mfc\include\32-bit\afxtls_.h  \
		..\..\..\..\include\shellapi.h ..\..\..\..\include\win32\shellapi.h ..\..\..\..\mfc\include\afxres.h ..\..\..\..\mfc\include\32-bit\afxres.h  \
		..\..\..\..\mfc\include\afxmsg_.h ..\..\..\..\mfc\include\32-bit\afxmsg_.h ..\..\..\..\mfc\include\afxdd_.h ..\..\..\..\mfc\include\32-bit\afxdd_.h  \
		..\..\..\..\mfc\include\afxdll_.h ..\..\..\..\mfc\include\32-bit\afxdll_.h ..\..\..\..\mfc\include\afxext.h ..\..\..\..\mfc\include\32-bit\afxext.h  \
		..\..\..\..\mfc\include\afxdlgs.h ..\..\..\..\mfc\include\32-bit\afxdlgs.h ..\..\..\..\include\commdlg.h ..\..\..\..\include\win32\COMMDLG.H  \
		..\..\..\..\include\richedit.h ..\..\..\..\include\win32\RICHEDIT.H ..\..\..\..\mfc\include\afxole.h ..\..\..\..\mfc\include\32-bit\afxole.h  \
		..\..\..\..\mfc\include\afxdisp.h ..\..\..\..\mfc\include\32-bit\afxdisp.h ..\..\..\..\include\objbase.h ..\..\..\..\include\win32\objbase.h  \
		..\..\..\..\include\rpc.h ..\..\..\..\include\win32\rpc.h ..\..\..\..\include\rpcdce.h ..\..\..\..\include\win32\RPCDCE.H  \
		..\..\..\..\include\rpcdcep.h ..\..\..\..\include\win32\RPCDCEP.H ..\..\..\..\include\rpcnsi.h ..\..\..\..\include\win32\RPCNSI.H  \
		..\..\..\..\include\rpcnterr.h ..\..\..\..\include\win32\RPCNTERR.H ..\..\..\..\include\rpcndr.h ..\..\..\..\include\win32\RPCNDR.H  \
		..\..\..\..\include\rpcnsip.h ..\..\..\..\include\win32\RPCNSIP.H ..\..\..\..\include\pshpack8.h ..\..\..\..\include\win32\pshpack8.h  \
		..\..\..\..\include\wtypes.h ..\..\..\..\include\win32\wtypes.h ..\..\..\..\include\unknwn.h ..\..\..\..\include\win32\unknwn.h  \
		..\..\..\..\include\win32\ole2.h ..\..\..\..\include\oleauto.h ..\..\..\..\include\win32\OLEAUTO.H ..\..\..\..\include\oaidl.h  \
		..\..\..\..\include\win32\oaidl.h ..\..\..\..\include\win32\objidl.h ..\..\..\..\include\oleidl.h ..\..\..\..\include\win32\oleidl.h  \
		..\..\..\..\include\objidl.h ..\..\..\..\include\cguid.h ..\..\..\..\include\win32\CGUID.H ..\..\..\..\include\olectl.h  \
		..\..\..\..\include\win32\OLECTL.H ..\..\..\..\include\ocidl.h ..\..\..\..\include\win32\OCIDL.H ..\..\..\..\include\docobj.h  \
		..\..\..\..\include\win32\DOCOBJ.H ..\..\..\..\include\win32\servprov.h ..\..\..\..\include\urlmon.h ..\..\..\..\include\win32\URLMON.H  \
		..\..\..\..\mfc\include\afxcom_.h ..\..\..\..\mfc\include\32-bit\afxcom_.h ..\..\..\..\mfc\include\afxodlgs.h ..\..\..\..\mfc\include\32-bit\afxodlgs.h  \
		..\..\..\..\include\oledlg.h ..\..\..\..\include\win32\OLEDLG.H ..\..\..\..\include\dlgs.h ..\..\..\..\include\win32\DLGS.H  \
		..\..\..\..\mfc\include\afxcmn.h ..\..\..\..\mfc\include\32-bit\afxcmn.h ..\..\..\..\include\richole.h ..\..\..\..\include\win32\richole.h  \
		..\..\..\..\mfc\include\afxrich.h ..\..\..\..\mfc\include\32-bit\afxrich.h ..\..\..\..\mfc\include\afxpriv.h ..\..\..\..\mfc\include\32-bit\afxpriv.h  \
		..\..\..\..\mfc\include\afxadv.h ..\..\..\..\mfc\include\32-bit\afxadv.h ..\..\..\..\include\malloc.h ..\..\..\..\include\heapstat.h  \
		..\..\..\..\mfc\include\afxconv.h ..\..\..\..\mfc\include\32-bit\afxconv.h ..\..\..\..\mfc\include\afxpriv2.h ..\..\..\..\mfc\include\32-bit\afxpriv2.h  \
		doctype.h chicdial.h resource.h buttondi.h  \
		strings.h wordpad.h splash.h options.h  \
		..\..\..\..\mfc\include\afxtempl.h ..\..\..\..\mfc\include\32-bit\afxtempl.h ..\..\..\..\mfc\include\afxplex_.h ..\..\..\..\mfc\include\32-bit\afxplex_.h  \
		..\..\..\..\include\new.h wordpdoc.h wordpvw.h cntritem.h  \
		colorlis.h datedial.h helpids.h ddxm.h  \
		docopt.h multconv.h filenewd.h formatba.h  \
		formatpa.h formatta.h ruler.h ipframe.h  \
		key.h listdlg.h mainfrm.h mswd6_32.h  \
		unitspag.h optionsh.h pageset.h ..\..\..\..\include\memory.h  \
		srvritem.h ..\..\..\..\include\locale.h ..\..\..\..\include\penwin.h ..\..\..\..\include\win32\penwin.h  \
		..\..\..\..\mfc\include\32-bit\winres.h 

DEFFILE		= wordpad.DEF

!IF $(DEBUG)
OUTPUTDIR	= .
CREATEOUTPUTDIR	=
TARGETDIR	= .
CREATETARGETDIR	=

SYMROOT		=  .\stdafx 
SYMS		= $(SYMROOT).SYM 
LIBS		= KERNEL32.LIB GDI32.LIB USER32.LIB 

CFLAGS		=  -cpp -Ae -mn -C -D_WINDOWS -S -ND -3 -a8 -c -H -HO- -w- -w2 -g 
LFLAGS		=  /CO /NOI /DE /NOPACKF /XN /NT /ENTRY:WinMainCRTStartup /VERS:1.0 /BAS:4194304 /A:512 /RC   :wordpad.RES
DEFINES		= -D_DEBUG=1 -D_X86_=1 -D_MT=1 -D_AFXDLL=1 -D_MBCS=1
!ELSE
OUTPUTDIR	= .
CREATEOUTPUTDIR	=
TARGETDIR	= .
CREATETARGETDIR	=

SYMROOT		=  .\stdafx 
SYMS		= $(SYMROOT).SYM 
LIBS		= KERNEL32.LIB GDI32.LIB USER32.LIB 

CFLAGS		=  -cpp -Ae -mn -o+time -D_WINDOWS -ND -3 -a8 -c -H -HO- -w- -w2 -w6 
LFLAGS		=  /NOI /DE /PACKF /XN /NT /ENTRY:WinMainCRTStartup /VERS:1.0 /BAS:4194304 /A:512 /RC   :wordpad.RES
DEFINES		= -D_X86_=1 -D_MT=1 -D_AFXDLL=1 -D_MBCS=1
!ENDIF

HFLAGS		= $(CFLAGS) 
MFLAGS		= MASTERPROJ=$(PROJ) 
LIBFLAGS	=  /C 
RESFLAGS	=  -32 
DEBUGGERFLAGS	=  -ALLDLL 
AFLAGS		= $(CFLAGS) 
HELPFLAGS	= 

MODEL		= N

PAR		= PROJS BATS OBJS

RCDEFINES	= -D_DEBUG

INCLUDES	= 

INCLUDEDOBJS	= 

OBJS		= buttondi.OBJ chicdial.OBJ cntritem.OBJ  \
		colorlis.OBJ datedial.OBJ ddxm.OBJ docopt.OBJ  \
		doctype.OBJ filenewd.OBJ formatba.OBJ formatpa.OBJ  \
		formatta.OBJ ipframe.OBJ key.OBJ listdlg.OBJ  \
		mainfrm.OBJ multconv.OBJ options.OBJ optionsh.OBJ  \
		pageset.OBJ ruler.OBJ splash.OBJ srvritem.OBJ  \
		strings.OBJ unitspag.OBJ wordpad.OBJ wordpdoc.OBJ  \
		wordpvw.OBJ 

RCFILES		=  wordpad.RES 

RESFILES	= 

HELPFILES	= 

BATS		= 

.SUFFIXES: .C .CP .CPP .CXX .CC .H .HPP .HXX .COM .EXE .DLL .LIB .RTF .DLG .ASM .RES .RC .OBJ 

.C.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.c

.CPP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cpp

.CXX.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cxx

.CC.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cc

.CP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cp

.H.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.h

.HPP.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.hpp

.HXX.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.hxx

.C.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)   $*.c   -o$*.lst

.CPP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cpp -o$*.lst

.CXX.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cxx -o$*.lst

.CP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cp  -o$*.lst

.CC.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cc  -o$*.lst

.ASM.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.asm -o$*.lst

.OBJ.COD:
	$(DISASM) $*.OBJ -c

!IF $(DEBUG)
.OBJ.EXE:
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ELSE
.OBJ.EXE:
		$(LNK) $(LFLAGS) @$(PROJ).LNK<<
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ENDIF

.RTF.HLP:
	$(HC) $(HELPFLAGS) $*.HPJ

.ASM.OBJ:
	$(ASM) $(AFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.asm

.RC.RES: 
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $*.rc -o$*.res

.DLG.RES:
	echo ^#include "windows.h" >$$$*.rc
	echo ^IF EXIST "$*.h" >>$$$*.rc
	echo ^#include "$*.h" >>$$$*.rc
	echo ^#include "$*.dlg" >>$$$*.rc
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $$$*.rc
	-del $*.res
	-ren $$$*.res $*.res



all:	noteout createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done


all2:	createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done

noteout:
	REM Output to $(OUTPUTDIR)

createdir:
	$(CREATEOUTPUTDIR)
	$(CREATETARGETDIR)
	
$(TARGETDIR)\$(PROJ).$(PROJTYPE): $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(RCFILES) $(RESFILES) $(HELPFILES) $(DEFFILE)
			-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ENDIF

			-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-echo $(TARGETDIR)\$(PROJ).$(PROJTYPE) built

_done:
		REM  Project is up to date

buildall:	clean	all


clean:
		-del $(TARGETDIR)\$$SCW$$.$(PROJTYPE)
		-del $(PROJ).CLE
		-del $(OUTPUTDIR)\SCPH.SYM
		-del WORDPAD.dpd
		-del $(OBJS)
		-del $(SYMROOT).SYM
		-del $(SYMROOT).PCO
		-del wordpad.RES

cleanres:
		-del wordpad.RES

res:		cleanres $(RCFILES) all


link:
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
buttondi.OBJ+
chicdial.OBJ+
cntritem.OBJ+
colorlis.OBJ+
datedial.OBJ+
ddxm.OBJ+
docopt.OBJ+
doctype.OBJ+
filenewd.OBJ+
formatba.OBJ+
formatpa.OBJ+
formatta.OBJ+
ipframe.OBJ+
key.OBJ+
listdlg.OBJ+
mainfrm.OBJ+
multconv.OBJ+
options.OBJ+
optionsh.OBJ+
pageset.OBJ+
ruler.OBJ+
splash.OBJ+
srvritem.OBJ+
strings.OBJ+
unitspag.OBJ+
wordpad.OBJ+
wordpdoc.OBJ+
wordpvw.OBJ
$$SCW$$.EXE
NUL
KERNEL32.LIB GDI32.LIB USER32.LIB 
wordpad.DEF;
<<
!ENDIF

		-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
		-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)




!IF EXIST (WORDPAD.dpd)
!INCLUDE WORDPAD.dpd
!ENDIF
$(SYMROOT).SYM: stdafx.h
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF$(SYMROOT).SYM -o$(SYMROOT).PCO stdafx.h



