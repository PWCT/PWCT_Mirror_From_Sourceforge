ECHO OFF
CLS
ECHO =====================================
ECHO 	   Welcome to RVC2011 Setup
ECHO =====================================
echo Installing ODBC DATA Source
odbcconf CONFIGDSN "Microsoft Access Driver (*.mdb)" "DSN=PWCTRVCDATA | Trusted_Connection=Yes | DBQ=%cd%\data\sysdata.mdb"
odbcconf CONFIGDSN "SQL Native Client" "DSN=RVCSYSDATASQLDB|Server=MAHMOUD-PC\SQLEXPRESS | Database=mRVCSQL | Trusted_Connection=No  "
echo Installing RMChart ActiveX Control
regsvr32 rmchart.ocx /S
echo Installing Snapshot Viewer
cd tools
SNPVW.EXE
cd..
