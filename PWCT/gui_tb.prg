DEFINE CLASS TR_TEXTBOX AS TextBox
lAutoName = .f.
tAutoName = ""
lDefault = .f.

PROCEDURE gotfocus
	IF left(ALLTRIM(this.Value),1) == '"' .and. RIGHT(ALLTRIM(this.value),1) == '"'
		this.SelStart = 1

	ENDIF

RETURN

PROCEDURE keypress
LPARAMETERS nKeyCode, nShiftAltCtrl
IF nkeycode = 15 && ctrl+o
		PUBLIC objfromlist 
     objfromlist = ""
    	DO FORM selobj.scx
    	IF .not. EMPTY(objfromlist)
    	this.value = objfromlist
    	ENDIF
ENDIF

RETURN


PROCEDURE LOSTFOCUS
APPLICATION.ActiveForm.REFRESH
RETURN
PROCEDURE rightclick
DEFINE POPUP mencontex SHORTCUT RELATIVE FROM MROW(),MCOL()
DEFINE BAR 1 OF mencontex PROMPT  sysmsg(1508)
DEFINE BAR 2 OF mencontex PROMPT  sysmsg(1509)
DEFINE BAR 3 OF mencontex PROMPT  sysmsg(1576)
DEFINE BAR 4 OF mencontex PROMPT  "Select Object"
DEFINE BAR 5 OF mencontex PROMPT  " = True "
DEFINE BAR 6 OF mencontex PROMPT  " = False "

ON SELECTION BAR 1 OF mencontex _selec=1
ON SELECTION BAR 2 OF mencontex _selec=2
ON SELECTION BAR 3 OF mencontex _selec=3
ON SELECTION BAR 4 OF mencontex _selec=4
ON SELECTION BAR 5 OF mencontex _selec=5
ON SELECTION BAR 6 OF mencontex _selec=6
_selec=0
ACTIVATE POPUP mencontex
DO case
   CASE _selec = 1 
   
   cStartColor = "{"
   cEndColor = "}"
   IF .not. EMPTY(ALLTRIM(this.value))
   	IF LEN(ALLTRIM(this.value)) > 2
   		cStartColor = LEFT(ALLTRIM(this.value),1)
   		cEndColor = Right(ALLTRIM(this.value),1)
   	ENDIF
   endif
   
   mycolor = GETCOLOR()
   myg = INT(BITand(mycolor,RGB(0,255,0))/256) 
   myr = INT(BITand(mycolor,RGB(255,0,0))) 
   myb = INT(BITand(mycolor,RGB(0,0,255))/(256*256)) 
   this.value = cStartColor+ALLTRIM(STR(myr)) + ;
   "," + ALLTRIM(STR(myg)) + "," + ALLTRIM(STR(myb)) + cEndColor
   CASE _selec = 2
   myfont = GETFONT("Times New Roman")
   IF .not. EMPTY(myfont)
      x = AT(",",myfont)
      this.value = '"' + SUBSTR(myfont,1,x-1) + '"'
   ENDIF
   CASE _selec = 3
   myfile = GETFILE()
      IF .not. EMPTY(myfile)
         this.value = '"' + myfile + '"'
  	 ENDIF
    CASE _selec = 4
     PUBLIC objfromlist 
     objfromlist = ""
    	DO FORM selobj.scx
    	IF .not. EMPTY(objfromlist)
    	this.value = objfromlist
    	ENDIF
    CASE _selec = 5
    	this.value = "True "
    	CASE _selec = 6
    	this.value = "False "
ENDCASE
RETURN
ENDDEFINE
