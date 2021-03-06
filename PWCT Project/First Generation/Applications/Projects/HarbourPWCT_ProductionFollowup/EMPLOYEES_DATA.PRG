*---------------------------------------------------------------------------*
* Time : 13:12:42    Date : 06/07/2013
*---------------------------------------------------------------------------*
* Programming Without Coding Technology (PWCT) 
* 2006-2013 , Mahmoud Fayed <msfclipper@yahoo.com> 
* Version : PWCT 1.9 (Art) 2013.05.15
* URL : http://www.sourceforge.net/projects/doublesvsoop   
*---------------------------------------------------------------------------*
* Visual Programming Language : HarbourPWCT 
*---------------------------------------------------------------------------*
#include "SSXHB.ch"
#include "MiniGUI.ch"
#include "hbclass.ch"
Function EMPLOYEES_DATA
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

Resistance R_EMPLOYEES_DATA_18smart1() address Code Unit : Circuits\Main\Main\Main


Return 

* Resistance Code Unit : Circuits\Main\Main\Main
Resistance R_EMPLOYEES_DATA_18smart1() code
class EmployeesDataClass From SystemDatabase
Data TableName init "Employees"
Data cname init ""
Data cgender init ""
Data cage init ""
Data caddress init ""
Data cCity init ""
Data cwebsite init ""
Data ccountry init ""
Data cphone init ""
Data cemail init ""
Data cphone2 init ""
Data cfax init ""
Data cmobile init ""
Data czip init ""
Data cmobile2 init ""
Data ccompany init ""
Data cNotes init ""
Data genderitemsids init {}
Data genderitems init {}
Data countryitemsids init {}
Data countryitems init {}
Method showwindow
Method closewindow
Method SetMode
Method UserInterface2Class
Method Class2ADO
Method ADO2Class
Method Class2UserInterface
Method ClearRecord
Method AutoGotoRecord
Method printdata
Method EmpDetails
Method empvacations
EndClass
Method showwindow Class EmployeesDataClass
myout = self:connect()
myout = self:AutoGotoRecord()
if !iswindowdefined( EmployeesDataWindow )
DEFINE WINDOW EmployeesDataWindow ;
AT 10 ,10 ;
WIDTH 770 ;
HEIGHT 644 ;
ICON "PWCTICON" ;
TITLE "Employees - Data Window" ;
CHILD ;
NOMINIMIZE ;
NOMAXIMIZE ;
NOSIZE ;
BACKCOLOR {64,0,64} 
@ 49 ,6 IMAGE image1;
PICTURE "image\Back.jpg";
STRETCH ;
WIDTH 750 HEIGHT 495
@ 556 ,326 BUTTONEX btnFirst;
CAPTION "First";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:firstrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,389 BUTTONEX btnNext;
CAPTION "Next";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:nextrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,518 BUTTONEX btnLast;
CAPTION "Last";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:lastrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,673 BUTTONEX btnClose;
CAPTION "Close";
FONTCOLOR {0,0,0};
BACKCOLOR {132,242,179};
ON CLICK self:closewindow()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,455 BUTTONEX btnPrev;
CAPTION "Prev ";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:prevrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,587 BUTTONEX btnDel;
CAPTION "Delete";
FONTCOLOR {255,255,255};
BACKCOLOR {255,0,0};
ON CLICK self:delrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 556 ,162 BUTTONEX btnsave;
CAPTION "Save";
ON CLICK self:saverecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 556 ,234 BUTTONEX btncancel;
CAPTION "Cancel";
ON CLICK self:cancelrecord()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 556 ,91 BUTTONEX btnedit;
CAPTION "Edit";
ON CLICK self:editrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 556 ,8 BUTTONEX btnadd;
CAPTION "Add";
ON CLICK self:addrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 8 ,6 LABEL lblTitle ;
VALUE "    Employees Data" ;
WIDTH 300 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {128,128,0}
@ 77 ,73 LABEL lblname ;
VALUE "Name" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 75 ,179 TEXTBOX textName;
HEIGHT 30 ;
WIDTH 510 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
myout = self:LoadLookupTable("Gender","Gender",@self:GenderItems,"id",@self:GenderItemsIDS)
@ 118 ,74 LABEL lblGender ;
VALUE "Gender" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 116 ,180 COMBOBOX combogender;
WIDTH 200 ;
HEIGHT 100;
ITEMS self:genderitems ;
VALUE 1 ;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 116 ,401 LABEL lblAge ;
VALUE "Age" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 115 ,488 TEXTBOX textAge;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 159 ,74 LABEL lblAddress ;
VALUE "Address" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 157 ,179 TEXTBOX textAddress;
HEIGHT 30 ;
WIDTH 510 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 200 ,74 LABEL lblCity ;
VALUE "City" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 197 ,179 TEXTBOX textCity;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 197 ,401 LABEL lblWebsite ;
VALUE "Website" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 197 ,488 TEXTBOX textWebsite;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
myout = self:LoadLookupTable("Country","Country",@self:CountryItems,"id",@self:CountryItemsIDS)
@ 239 ,74 LABEL lblCountry ;
VALUE "Country" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 239 ,180 COMBOBOX combocountry;
WIDTH 200 ;
HEIGHT 100;
ITEMS self:countryitems ;
VALUE 1 ;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 239 ,401 LABEL lblPhone ;
VALUE "Phone" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 239 ,488 TEXTBOX textPhone;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 280 ,74 LABEL lbleMail ;
VALUE "eMail" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 280 ,179 TEXTBOX textEMAIL;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 280 ,401 LABEL lblPhone2 ;
VALUE "Phone2" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 280 ,488 TEXTBOX textPhone2;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 319 ,74 LABEL lblFax ;
VALUE "Fax" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 319 ,179 TEXTBOX textFax;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 319 ,401 LABEL lblMobile ;
VALUE "Mobile" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 319 ,488 TEXTBOX textMobile;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 362 ,74 LABEL lblZip ;
VALUE "Zip" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 362 ,179 TEXTBOX textZip;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 362 ,401 LABEL lblMobile2 ;
VALUE "Mobile2" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 363 ,488 TEXTBOX textMobile2;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 408 ,74 LABEL lblCompany ;
VALUE "Company" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 406 ,179 TEXTBOX textCompany;
HEIGHT 30 ;
WIDTH 510 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0} 
@ 448 ,74 LABEL lblNotes ;
VALUE "Notes" ;
WIDTH 100 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 449 ,179 EDITBOX EditNotes;
WIDTH 510 ;
HEIGHT 70;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 7 ,553 BUTTONEX btnPrint;
CAPTION "Print Employee Data";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:printdata()  ;
WIDTH 203 HEIGHT 34 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 7 ,438 BUTTONEX btnDetails;
CAPTION "Details";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:empdetails()  ;
WIDTH 110 HEIGHT 34 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 7 ,311 BUTTONEX btnVacations;
CAPTION "Vacations";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:empvacations()  ;
WIDTH 120 HEIGHT 34 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
END WINDOW
EmployeesDataWindow.Center ( )
myout = self:showrecord()
myout = self:setmode(2)
ACTIVATE WINDOW EmployeesDataWindow
EndIF
Return 0
Method UserInterface2Class Class EmployeesDataClass
self:cName := EmployeesDataWindow.textName.Value
self:cGender := EmployeesDataWindow.ComboGender.Value
self:cAge := EmployeesDataWindow.textAge.Value
self:cAddress := EmployeesDataWindow.textAddress.Value
self:cCity := EmployeesDataWindow.textCity.Value
self:cWebsite := EmployeesDataWindow.textWebsite.Value
self:cCountry := EmployeesDataWindow.comboCountry.Value
self:cPhone := EmployeesDataWindow.textPhone.Value
self:cEMAIL := EmployeesDataWindow.textEMAIL.Value
self:cPHONE2 := EmployeesDataWindow.textPHONE2.Value
self:cFax := EmployeesDataWindow.textFax.Value
self:cMobile := EmployeesDataWindow.textMobile.Value
self:cZip := EmployeesDataWindow.textZip.Value
self:cMobile2 := EmployeesDataWindow.textMobile2.Value
self:cCompany := EmployeesDataWindow.textCompany.Value
self:cNotes := EmployeesDataWindow.editNotes.Value
self:cGender := self:GenderItemsids[self:cGender]
self:cCountry := self:CountryItemsIDS[self:cCountry]
Return 0
Method Class2ADO Class EmployeesDataClass
self:oRS:fields:item(alltrim("f_name")):value := self:cName
self:oRS:fields:item(alltrim("f_gender")):value := self:cGender
self:oRS:fields:item(alltrim("f_age")):value := self:cAge
self:oRS:fields:item(alltrim("f_Address")):value := self:cAddress
self:oRS:fields:item(alltrim("f_city")):value := self:cCity
self:oRS:fields:item(alltrim("f_Website")):value := self:cWebsite
self:oRS:fields:item(alltrim("f_country")):value := self:cCountry
self:oRS:fields:item(alltrim("f_phone")):value := self:cPhone
self:oRS:fields:item(alltrim("f_email")):value := self:ceMail
self:oRS:fields:item(alltrim("f_phone2")):value := self:cPhone2
self:oRS:fields:item(alltrim("f_fax")):value := self:cFax
self:oRS:fields:item(alltrim("f_mobile")):value := self:cMobile
self:oRS:fields:item(alltrim("f_zip")):value := self:czip
self:oRS:fields:item(alltrim("f_Mobile2")):value := self:cMobile2
self:oRS:fields:item(alltrim("f_company")):value := self:cCompany
self:oRS:fields:item(alltrim("f_notes")):value := self:cNotes
Return 0
Method ADO2Class Class EmployeesDataClass
self:cname := self:oRS:fields:item(alltrim("f_name")):value
self:cgender := self:oRS:fields:item(alltrim("f_gender")):value
self:cage := self:oRS:fields:item(alltrim("f_age")):value
self:caddress := self:oRS:fields:item(alltrim("f_address")):value
self:cCity := self:oRS:fields:item(alltrim("f_city")):value
self:cwebsite := self:oRS:fields:item(alltrim("f_website")):value
self:ccountry := self:oRS:fields:item(alltrim("f_country")):value
self:cphone := self:oRS:fields:item(alltrim("f_phone")):value
self:cemail := self:oRS:fields:item(alltrim("f_email")):value
self:cphone2 := self:oRS:fields:item(alltrim("f_phone2")):value
self:cfax := self:oRS:fields:item(alltrim("f_fax")):value
self:cmobile := self:oRS:fields:item(alltrim("f_mobile")):value
self:czip := self:oRS:fields:item(alltrim("f_zip")):value
self:cmobile2 := self:oRS:fields:item(alltrim("f_mobile2")):value
self:ccompany := self:oRS:fields:item(alltrim("f_company")):value
self:cNotes := self:oRS:fields:item(alltrim("f_notes")):value
Return 0
Method Class2UserInterface Class EmployeesDataClass
EmployeesDataWindow.textName.Value := self:cname
self:cGender = self:LookupIDToIndex(self:cGender,@self:GenderItemsids)
EmployeesDataWindow.comboGender.Value := self:cGender
EmployeesDataWindow.textAge.Value := self:cage
EmployeesDataWindow.textAddress.Value := self:cAddress
EmployeesDataWindow.textCity.Value := self:cCity
EmployeesDataWindow.textWebsite.Value := self:cWebsite
self:cCountry = self:LookupIDToIndex(self:cCountry,@self:CountryItemsIDS)
EmployeesDataWindow.comboCountry.Value := self:cCountry
EmployeesDataWindow.textPhone.Value := self:cPhone
EmployeesDataWindow.texteMail.Value := self:ceMail
EmployeesDataWindow.textPhone2.Value := self:cphone2
EmployeesDataWindow.textFax.Value := self:cFax
EmployeesDataWindow.textMobile.Value := self:cMobile
EmployeesDataWindow.textZip.Value := self:cZip
EmployeesDataWindow.textMobile2.Value := self:cMobile2
EmployeesDataWindow.textCompany.Value := self:cCompany
EmployeesDataWindow.editNotes.Value := self:cNotes
Return 0
Method ClearRecord Class EmployeesDataClass
self:cname := ""
self:cGender := 0
self:cAge := ""
self:cAddress := ""
self:cCity := ""
self:cWebsite := ""
self:cCountry := 0
self:cPhone := ""
self:cEmail := ""
self:cPhone2 := ""
self:cFax := ""
self:cMobile := ""
self:cZip := ""
self:cMobile2 := ""
self:cCompany := ""
self:cNotes := ""
Return 0
Method PrintData Class EmployeesDataClass
Local myid,myout
mymax := self:oRS:RecordCount
IF mymax = 0
MyOut := MSGBOX("No Record to Print","Sorry")
Return 0
ENDIF
myid := self:oRS:fields:item(alltrim("id")):value
myid = STR ( myid )
Employeesreportobject:filter := "id = "+myid
myout = Employeesreportobject:ShowWindow()
Return 0
Method EmpDetails Class EmployeesDataClass
Local myid,myout,myrs,empdetailsids
mymax := self:oRS:RecordCount
IF mymax = 0
MyOut := MSGBOX("No Record in Employees Table","Sorry")
Return 0
ENDIF
myid := self:oRS:fields:item(alltrim("id")):value
myRS := TOLEAUTO():NEW( "ADODB.Recordset" )
myRS:CursorType := 1
myRS:ActiveConnection := self:oCon
myRS:open ( "Select * from EmpDetails",self:oCon,3,3 )
mymax := myRS:RecordCount
IF mymax = 0
MyOut := MSGBOX("No Records in details table","Sorry")
Return 0
ENDIF
myRS:MOVEFIRST()
empdetailsids := {}
FOR x = 1 TO mymax STEP 1
MYDETAILID := myRS:fields:item(alltrim("ID")):value
AADD( EMPDETAILSIDS , MYDETAILID)
MYRS:MOVENEXT()
Next
myRS:Close()
FOR x = 1 TO mymax STEP 1
myRS := TOLEAUTO():NEW( "ADODB.Recordset" )
myRS:CursorType := 1
myRS:ActiveConnection := self:oCon
myRS:open ( "Select * from EmpDetailsValues where empid = " + str(myid) + " and detailID = " + str(empdetailsids[x]),self:oCon,3,3 )
mymax2 := myRS:RecordCount
IF mymax2 = 0
myRS:ADDNEW()
myRS:fields:item(alltrim("empid")):value := myid
myRS:fields:item(alltrim("Detailid")):value := empdetailsids[x]
myRS:UPDATE()
ENDIF
myRS:Close()
Next
EmpDetailsValuesDataBrowseObject:EmpID := myid
myout = EmpDetailsValuesDataBrowseObject:ShowWindow()
Return 0
Method EmpVacations Class EmployeesDataClass
mymax := self:oRS:RecordCount
IF mymax = 0
MyOut := MSGBOX("No Record in Employees Table","Sorry")
Return 0
ENDIF
myid := self:oRS:fields:item(alltrim("id")):value
VacationsDataBrowseObject:nEmpID := myID
VacationsDataBrowseObject:ComplexSearch := " and EmpID = " + alltrim(str(myID))
myout = VacationsDataBrowseObject:ShowWindow()
Return 0
Method closewindow Class EmployeesDataClass
myout = self:disconnect()
EmployeesDataWindow.Release ( )
Return 0
Method setmode(p1) Class EmployeesDataClass
IF p1 = 1
EmployeesDataWindow.btnfirst.Enabled := false
EmployeesDataWindow.btnnext.Enabled := false
EmployeesDataWindow.btnprev.Enabled := false
EmployeesDataWindow.btnlast.Enabled := false
EmployeesDataWindow.btndel.Enabled := false
EmployeesDataWindow.btnclose.Enabled := false
EmployeesDataWindow.btnsave.Enabled := true
EmployeesDataWindow.btncancel.Enabled := true
EmployeesDataWindow.btnedit.Enabled := false
EmployeesDataWindow.btnadd.Enabled := false
EmployeesDataWindow.textName.Enabled := true
EmployeesDataWindow.textCity.Enabled := true
EmployeesDataWindow.textAddress.Enabled := true
EmployeesDataWindow.textZip.Enabled := true
EmployeesDataWindow.textFax.Enabled := true
EmployeesDataWindow.texteMail.Enabled := true
EmployeesDataWindow.textAge.Enabled := true
EmployeesDataWindow.textCompany.Enabled := true
EmployeesDataWindow.textWebsite.Enabled := true
EmployeesDataWindow.textPhone.Enabled := true
EmployeesDataWindow.textphone2.Enabled := true
EmployeesDataWindow.textmobile.Enabled := true
EmployeesDataWindow.textmobile2.Enabled := true
EmployeesDataWindow.comboGender.Enabled := true
EmployeesDataWindow.comboCountry.Enabled := true
EmployeesDataWindow.editNotes.Enabled := true
ENDIF
IF p1 = 2
EmployeesDataWindow.btnfirst.Enabled := true
EmployeesDataWindow.btnnext.Enabled := true
EmployeesDataWindow.btnprev.Enabled := true
EmployeesDataWindow.btnlast.Enabled := true
EmployeesDataWindow.btndel.Enabled := true
EmployeesDataWindow.btnclose.Enabled := true
EmployeesDataWindow.btnsave.Enabled := false
EmployeesDataWindow.btncancel.Enabled := false
EmployeesDataWindow.btnedit.Enabled := true
EmployeesDataWindow.btnadd.Enabled := true
EmployeesDataWindow.textName.Enabled := false
EmployeesDataWindow.textCity.Enabled := false
EmployeesDataWindow.textAddress.Enabled := false
EmployeesDataWindow.textZip.Enabled := false
EmployeesDataWindow.textFax.Enabled := false
EmployeesDataWindow.texteMail.Enabled := false
EmployeesDataWindow.textAge.Enabled := false
EmployeesDataWindow.textCompany.Enabled := false
EmployeesDataWindow.textWebsite.Enabled := false
EmployeesDataWindow.textPhone.Enabled := false
EmployeesDataWindow.textphone2.Enabled := false
EmployeesDataWindow.textmobile.Enabled := false
EmployeesDataWindow.textmobile2.Enabled := false
EmployeesDataWindow.comboGender.Enabled := false
EmployeesDataWindow.comboCountry.Enabled := false
EmployeesDataWindow.editNotes.Enabled := false
ENDIF
self:OperationMode := p1
Return 0
Method AutoGotoRecord Class EmployeesDataClass
IF self:LFindRecord = true .and. self:OperationMode = 2
self:oRS:Find(self:CFindExpr)
mycheck := self:oRS:EOF()
IF mycheck = true
self:oRS:MOVEPREVIOUS()
ENDIF
IF iswindowdefined( EmployeesDataWindow )
myout = self:showrecord()
EmployeesDataWindow.SetFocus ( )
ENDIF
ENDIF
self:LFindRecord := false
self:CFindExpr := ""
Return 0

End Of Resistance

*-------------------------------------------------------------------*
