*:******************************************************************************
*:
*: Procedure File D:\PWCTSRC\PWCT\PRG\SYSLOGMSG.PRG
*:
*:	
*:	
*:	
*:	
*:	
*:	
*:	
*:	
*:	Mahmoud Fayed
*:	Programming without coding technology 1.8 (Smart)
*:	Free - Open Source
*:	
*:	Programming without coding technology 1.8 (Smart)
*:
*: Documented using Visual FoxPro Formatting wizard version  .05
*:******************************************************************************
*:   syslogmsg
PARAMETERS mymsg

DIMENSION pwct_statusmsgs(ALEN(pwct_statusmsgs,1)+1)
pwct_statusmsgs(ALEN(pwct_statusmsgs,1)) = mymsg
