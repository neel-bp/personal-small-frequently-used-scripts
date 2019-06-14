@echo off
echo.
echo ====================3rdstrike quick input playback====================
echo enter date/time to play the input file associated with that date/time
echo the format of date is YYYY-MM-DD and time format is 24 hours
echo example: 2019-06-14_1506
echo ======================================================================
echo.
set /p datetime=enter date/time: 
shmupmame64_v42.exe sfiii3nr1 -playback %datetime%.inp
