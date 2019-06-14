@echo off
echo.
echo ======Mame input recording/playback======
echo =========================================
echo.
set /p game=enter the rom name: 
set /p file=enter the filename: 

echo =================================================
echo Note: enter 1 for record and enter 2 for playback.
echo =================================================
set /p trigger=record or playback? 

IF %trigger%==1 (shmupmame64_v42.exe %game% -record %file%.inp)
IF %trigger%==2 (shmupmame64_v42.exe %game% -playback %file%.inp)

exit