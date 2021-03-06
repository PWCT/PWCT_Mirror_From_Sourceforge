*---------------------------------------------------------------------------*
* Time : 06:45:30    Date : 10/27/2011
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
Function CUSTDATABROWSE
Public True,False 
True = .T. 
False = .F. 
 Details :
 * (Noun) *
Parameters SP1,SP2,SP3,SP4,SP5,SP6,SP7,SP8
	DataUnit :
	CodeUnit :
			Circuit        Main                          
				Branch     Main                          
					Resistance Main                          
	VetoUnit :

Resistance R_CUSTDATABROWSE_18smart1() address Code Unit : Circuits\Main\Main\Main


Return 

* Resistance Code Unit : Circuits\Main\Main\Main
Resistance R_CUSTDATABROWSE_18smart1() code
class CustDataBrowseClass From SystemDatabase
Data cWindowName init "CustDataBrowseWindow"
Data TableName init "Customers"
Data column init "CustName"
Data PrimaryKey init "id"
Data columns init {"ID","CustName"}
Data nID init 0
Data cName init ""
Data ColTitles init {"ID","Name"}
Data ColWidths init {100,200}
Method showwindow
Method closewindow
Method SetMode
Method UserInterface2Class
Method Class2ADO
Method ADO2Class
Method Class2UserInterface
Method ClearRecord
Method AutoGotoRecord
Method OpenDataWindow
Method showdatawindow
Method myTimer
Method BeforeSearch
Method SearchAdd
Method settimer
Method GetSearchValue
EndClass
Method showwindow Class CustDataBrowseClass
myout = self:connect()
myout = self:AutoGotoRecord()
if !iswindowdefined( &(self:cWindowName) )
DEFINE WINDOW &(self:cWindowName) ;
AT 10 ,10 ;
WIDTH 774 ;
HEIGHT 418 ;
ON INIT self:Search()  ;
ICON "PWCTICON" ;
TITLE "Data/Browse Window" ;
CHILD ;
NOMINIMIZE ;
NOMAXIMIZE ;
NOSIZE ;
BACKCOLOR {64,0,64}

@ 41 ,5 IMAGE image1;
PICTURE "Image\back.jpg";
STRETCH ;
WIDTH 750 HEIGHT 290
@ 340 ,326 BUTTONEX btnFirst;
CAPTION "First";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:firstrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,389 BUTTONEX btnNext;
CAPTION "Next";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:nextrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,516 BUTTONEX btnLast;
CAPTION "Last";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:lastrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,672 BUTTONEX btnClose;
CAPTION "Close";
FONTCOLOR {0,0,0};
BACKCOLOR {132,242,179};
ON CLICK self:closewindow()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,453 BUTTONEX btnPrev;
CAPTION "Prev ";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:prevrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,585 BUTTONEX btnDel;
CAPTION "Delete";
FONTCOLOR {255,255,255};
BACKCOLOR {255,0,0};
ON CLICK self:delrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 340 ,162 BUTTONEX btnsave;
CAPTION "Save";
ON CLICK self:saverecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 340 ,234 BUTTONEX btncancel;
CAPTION "Cancel";
ON CLICK self:cancelrecord()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 340 ,90 BUTTONEX btnedit;
CAPTION "Edit";
ON CLICK self:editrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 340 ,7 BUTTONEX btnadd;
CAPTION "Add";
ON CLICK self:addrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 6 ,4 LABEL lblTitle ;
VALUE "                                              Customers Data/Browse Window" ;
WIDTH 750 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 280 ,111 LABEL lblAddress ;
VALUE "Name" ;
WIDTH 70 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {255,255,255} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 276 ,188 TEXTBOX textName;
HEIGHT 30 ;
WIDTH 440 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}

@ 52 ,104 LABEL lbl1browse ;
VALUE "Name" ;
WIDTH 70 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {255,255,255} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 53 ,188 TEXTBOX textNamebrowse;
HEIGHT 30 ;
WIDTH 440 ;
BACKCOLOR {0,255,128} ;
FONTCOLOR {0,0,0}

@ 50 ,637 BUTTONEX btn1browse;
CAPTION "Search";
ON CLICK self:search()  ;
WIDTH 100 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 94 ,187 GRID Grid1browse;
ON CHANGE self:OpenDataWindow  ;
WIDTH 440 ;
HEIGHT 160 ;
HEADERS self:ColTitles;
WIDTHS self:ColWidths ;
FONT "Arial" SIZE 9 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
DEFINE TIMER Timer1 INTERVAL 1000 ;
Action self:myTimer()
END WINDOW

&(self:cWindowName).Center ( )
myout = self:showrecord()
myout = self:setmode(2)
&(self:cWindowName).Timer1.Enabled := false
ACTIVATE WINDOW &(self:cWindowName)
EndIF

Return 0
Method UserInterface2Class Class CustDataBrowseClass
self:cName := &(self:cWindowName).textName.Value
Return 0
Method Class2ADO Class CustDataBrowseClass
self:oRS:fields:item("CustName"):value := self:cName
Return 0
Method ADO2Class Class CustDataBrowseClass
self:cName := self:oRS:fields:item("CustName"):value
Return 0
Method Class2UserInterface Class CustDataBrowseClass
&(self:cWindowName).textName.Value := self:cName
Return 0
Method ClearRecord Class CustDataBrowseClass
self:cName := ""
Return 0
Method setmode(p1) Class CustDataBrowseClass
IF p1 = 1
&(self:cWindowName).btnfirst.Enabled := false
&(self:cWindowName).btnnext.Enabled := false
&(self:cWindowName).btnprev.Enabled := false
&(self:cWindowName).btnlast.Enabled := false
&(self:cWindowName).btndel.Enabled := false
&(self:cWindowName).btnclose.Enabled := false
&(self:cWindowName).btnsave.Enabled := true
&(self:cWindowName).btncancel.Enabled := true
&(self:cWindowName).btnedit.Enabled := false
&(self:cWindowName).btnadd.Enabled := false
&(self:cWindowName).textName.Enabled := true
&(self:cWindowName).textNameBrowse.Enabled := false
&(self:cWindowName).btn1Browse.Enabled := false
&(self:cWindowName).Grid1Browse.Enabled := false
ENDIF
IF p1 = 2
&(self:cWindowName).btnfirst.Enabled := true
&(self:cWindowName).btnnext.Enabled := true
&(self:cWindowName).btnprev.Enabled := true
&(self:cWindowName).btnlast.Enabled := true
&(self:cWindowName).btndel.Enabled := true
&(self:cWindowName).btnclose.Enabled := true
&(self:cWindowName).btnsave.Enabled := false
&(self:cWindowName).btncancel.Enabled := false
&(self:cWindowName).btnedit.Enabled := true
&(self:cWindowName).btnadd.Enabled := true
&(self:cWindowName).textName.Enabled := false
&(self:cWindowName).textNameBrowse.Enabled := True
&(self:cWindowName).btn1Browse.Enabled := True
&(self:cWindowName).Grid1Browse.Enabled := True
ENDIF
self:OperationMode := p1
Return 0
Method closewindow Class CustDataBrowseClass
myout = self:disconnect()
&(self:cWindowName).Release ( )
Return 0
Method AutoGotoRecord Class CustDataBrowseClass
IF self:LFindRecord = true .and. self:OperationMode = 2
self:oRS:Find(self:CFindExpr)
mycheck := self:oRS:EOF()
IF mycheck = true
self:oRS:MOVEPREVIOUS()
ENDIF
IF iswindowdefined( &(self:cWindowName) )
myout = self:showrecord()
&(self:cWindowName).SetFocus ( )
ENDIF
ENDIF
self:LFindRecord := false
self:CFindExpr := ""
Return 0
Method BeforeSearch Class CustDataBrowseClass
&(self:cWindowName).grid1Browse.DeleteAllItems ( )
&(self:cWindowName).grid1Browse.Value := 0
Return 0
Method SearchAdd(temp_array) Class CustDataBrowseClass
&(self:cWindowName).grid1Browse.AddItem ( temp_array )
Return 0
Method SetTimer(p1) Class CustDataBrowseClass
&(self:cWindowName).Timer1.Enabled := p1
Return 0
Method GetSearchValue Class CustDataBrowseClass
cName := &(self:cWindowName).textNameBrowse.Value
Return cName
Method OpenDataWindow Class CustDataBrowseClass
Local nvalue,myout
nvalue := &(self:cWindowName).grid1browse.Value
IF nvalue > 0
myout = self:ShowDataWindow(nvalue)
&(self:cWindowName).Grid1Browse.SetFocus ( )
ENDIF
Return 0
Method ShowDataWindow(nvalue) Class CustDataBrowseClass
self:LFindRecord := true
self:CFindExpr := self:primarykey+"= '"+self:resultprimarykeys[nvalue]+"' "
myout = self:ShowWindow()
Return 0
Method mytimer Class CustDataBrowseClass
myout = self:search()
&(self:cWindowName).Timer1.Enabled := false
Return 0



End Of Resistance

*-------------------------------------------------------------------*
