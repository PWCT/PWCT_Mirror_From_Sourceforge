*---------------------------------------------------------------------------*
* Time : 19:48:03    Date : 10/21/2011
*---------------------------------------------------------------------------*
* Programming without coding technology 1.8 (Smart) [2006-2011]  
* URL : http://www.sourceforge.net/projects/doublesvsoop   
*---------------------------------------------------------------------------*
* Visual Programming Language : HarbourPWCT 
*---------------------------------------------------------------------------*
* Compilers                   : Borland C/C++ & Harbour
* GUI Framework               : HarbourMiniGUI Extended
*---------------------------------------------------------------------------*
#include "SSXHB.ch"
#include "MiniGUI.ch"
#include "hbclass.ch"
Function Main
Public True,False 
True = .T. 
False = .F. 
New Server Server1 Type Slave Server Eigen Value 000
 Details :
	DataUnit :
	CodeUnit :
			Circuit        Main                          
				Branch     Main                          
					Resistance Main                          
	VetoUnit :
End Of Server 

	Resistance WIN32EVENTS() Address Code Unit : WIN32EVENTS

  ADD RESISTANCE WIN32EVENTS 


Resistance R_DEMO_18smart1() address Code Unit : Circuits\Main\Main\Main


CALL RESISTANCE Circuits\Main\Main\Main
Return 

  FUNCTION STARTSERVER()
   	Server FireON
  RETURN

  RESISTANCE WIN32EVENTS() CODE
	   DO EVENTS
  RETURN

* Resistance Code Unit : Circuits\Main\Main\Main
Resistance R_DEMO_18smart1() code
if !iswindowdefined( win1 )
DEFINE WINDOW win1 ;
AT 10 ,10 ;
WIDTH 500 ;
HEIGHT 400 ;
ICON "PWCTICON" ;
TITLE "Window Title" ;
MAIN ;
BACKCOLOR {236,233,216} 

@ 165 ,195 BUTTONEX btn1;
CAPTION "Get Form Shot";
FONTCOLOR {0,0,0};
BACKCOLOR {236,233,216};
ON CLICK getshot()  ;
WIDTH 100 HEIGHT 30 ;
FONT "arial" SIZE 9 ;
TOOLTIP ""
END WINDOW

win1.Center ( )
ACTIVATE WINDOW win1
EndIF

Proc getshot
PutFile := PutFile ( {{"Image","*.JPG" } } , ;
" Save As " , ;
, ;
, ;
)
win1.SaveAs ( putfile )
Return Nil


End Of Resistance

INIT PROCEDURE Init_DEMO
START DOUBLES
SS_ESARES("Circuits\Main\Main\Main",49)
SS_ESAGOAL("Circuits\Main\Main\Main","Main")
SS_ESASTEP("Circuits\Main\Main\Main","Define New Window  ( win1 ) , Title : 'Window Title'",1,5)
SS_ESASTEP("Circuits\Main\Main\Main","Window Properties",6,10)
SS_ESASTEP("Circuits\Main\Main\Main","Define New Button ( btn1 ) , Caption : 'Get Form Shot'",11,14)
SS_ESASTEP("Circuits\Main\Main\Main","Event: ON CLICK : Action getshot",15,15)
SS_ESASTEP("Circuits\Main\Main\Main","Button Properties",16,18)
SS_ESASTEP("Circuits\Main\Main\Main","End Of Window",19,20)
SS_ESASTEP("Circuits\Main\Main\Main","win1.Center ( )",21,21)
SS_ESASTEP("Circuits\Main\Main\Main","Activate window",22,24)
SS_ESASTEP("Circuits\Main\Main\Main","Define Procedure getshot",25,25)
SS_ESASTEP("Circuits\Main\Main\Main","PutFile := Put File",26,30)
SS_ESASTEP("Circuits\Main\Main\Main","win1.SaveAs ( putfile )",31,31)
SS_ESASTEP("Circuits\Main\Main\Main","End of Procedure",32,32)
Return
*-------------------------------------------------------------------*
