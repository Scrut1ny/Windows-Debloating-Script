@echo off

fltmc >nul 2>&1 || (
    echo(&echo   [33m# Administrator privileges are required.&echo([0m
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo   [33m# Right-click on the script and select "Run as administrator".[0m
        >nul pause&exit 1
    )
    exit 0
)

>>"%WINDIR%\System32\drivers\etc\hosts" (
	echo 127.0.0.1 a-0001.a-msedge.net
	echo 127.0.0.1 a.ads1.msn.com
	echo 127.0.0.1 a.ads2.msn.com
	echo 127.0.0.1 ad.doubleclick.net
	echo 127.0.0.1 adnexus.net
	echo 127.0.0.1 adnxs.com
	echo 127.0.0.1 ads1.msads.net
	echo 127.0.0.1 ads1.msn.com
	echo 127.0.0.1 ads.msn.com
	echo 127.0.0.1 alpha.telemetry.microsft.com
	echo 127.0.0.1 asimov-win.settings.data.microsoft.com.akadns.net
	echo 127.0.0.1 az361816.vo.msecnd.net
	echo 127.0.0.1 az512334.vo.msecnd.net
	echo 127.0.0.1 ca.telemetry.microsoft.com
	echo 127.0.0.1 cache.datamart.windows.com
	echo 127.0.0.1 ceuswatcab01.blob.core.windows.net
	echo 127.0.0.1 ceuswatcab02.blob.core.windows.net
	echo 127.0.0.1 choice.microsoft.com
	echo 127.0.0.1 choice.microsoft.com.nsatc.net
	echo 127.0.0.1 choice.microsoft.com.nstac.net
	echo 127.0.0.1 compatexchange.cloudapp.net
	echo 127.0.0.1 corp.sts.microsoft.com
	echo 127.0.0.1 corpext.msitadfs.glbdns2.microsoft.com
	echo 127.0.0.1 cs1.wpc.v0cdn.net
	echo 127.0.0.1 db3wns2011111.wns.windows.com
	echo 127.0.0.1 db5-eap.settings-win.data.microsoft.com.akadns.net
	echo 127.0.0.1 db5.settings-win.data.microsoft.com.akadns.net
	echo 127.0.0.1 db5.vortex.data.microsoft.com.akadns.net
	echo 127.0.0.1 df.telemetry.microsoft.com
	echo 127.0.0.1 diagnostics.support.microsoft.com
	echo 127.0.0.1 eaus2watcab01.blob.core.windows.net
	echo 127.0.0.1 eaus2watcab02.blob.core.windows.net
	echo 127.0.0.1 eu.vortex-win.data.microsft.com
	echo 127.0.0.1 fe2.update.microsoft.com.akadns.net
	echo 127.0.0.1 fe3.delivery.dsp.mp.microsoft.com.nsatc.net
	echo 127.0.0.1 feedback.microsoft-hohm.com
	echo 127.0.0.1 feedback.search.microsoft.com
	echo 127.0.0.1 feedback.windows.com
	echo 127.0.0.1 geo.settings-win.data.microsoft.com.akadns.net
	echo 127.0.0.1 geo.vortex.data.microsoft.com.akadns.net
	echo 127.0.0.1 i1.services.social.microsoft.com
	echo 127.0.0.1 i1.services.social.microsoft.com.nsatc.net
	echo 127.0.0.1 msnbot-207-46-194-33.search.msn.com
	echo 127.0.0.1 oca.telemetry.microsft.com
	echo 127.0.0.1 oca.telemetry.microsoft.com
	echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net
	echo 127.0.0.1 pre.footprintpredict.com
	echo 127.0.0.1 preview.msn.com
	echo 127.0.0.1 rad.msn.com
	echo 127.0.0.1 redir.metaservices.microsoft.com
	echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com
	echo 127.0.0.1 s0.2mdn.net
	echo 127.0.0.1 services.wes.df.telemetry.microsoft.com
	echo 127.0.0.1 settings-sandbox.data.microsoft.com
	echo 127.0.0.1 settings-win.data.microsoft.com
	echo 127.0.0.1 settings.data.microsof.com
	echo 127.0.0.1 sls.update.microsoft.com.akadns.net
	echo 127.0.0.1 spynet2.microsoft.com
	echo 127.0.0.1 spynetalt.microsoft.com
	echo 127.0.0.1 sqm.df.telemetry.microsoft.com
	echo 127.0.0.1 sqm.telemetry.microsoft.com
	echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net
	echo 127.0.0.1 ssw.live.com
	echo 127.0.0.1 statsfe1.ws.microsoft.com
	echo 127.0.0.1 statsfe2.update.microsoft.com.akadns.net
	echo 127.0.0.1 statsfe2.ws.microsoft.com
	echo 127.0.0.1 survey.watson.microsoft.com
	echo 127.0.0.1 telecommand.telemetry.microsoft.com
	echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net
	echo 127.0.0.1 telemetry.appex.bing.net
	echo 127.0.0.1 telemetry.microsoft.comecho 
	echo 127.0.0.1 telemetry.urs.microsoft.com
	echo 127.0.0.1 us.vortex-win.data.microsft.com
	echo 127.0.0.1 v10-win.vortex.data.microsft.com.akadns.net
	echo 127.0.0.1 v10.vortex-win.data.microsft.com
	echo 127.0.0.1 v10.vortex-win.data.microsoft.com
	echo 127.0.0.1 view.atdmt.com
	echo 127.0.0.1 vortex-sandbox.data.microsoft.com
	echo 127.0.0.1 vortex-win-sandbox.data.microsoft.com
	echo 127.0.0.1 vortex-win.data.microsoft.com
	echo 127.0.0.1 vortex.data.microsoft.com
	echo 127.0.0.1 watson.live.com
	echo 127.0.0.1 watson.microsoft.com
	echo 127.0.0.1 watson.ppe.telemetry.microsoft.com
	echo 127.0.0.1 watson.telemetry.microsoft.com
	echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net
	echo 127.0.0.1 wes.df.telemetry.microsoft.com
	echo 127.0.0.1 weus2watcab01.blob.core.windows.net
	echo 127.0.0.1 weus2watcab02.blob.core.windows.net
	echo 127.0.0.1 win10.ipv6.microsoft.com
	
)

if not errorlevel 1 (echo Success) else (echo Failure)

ipconfig/flushdns>nul
pause>nul
