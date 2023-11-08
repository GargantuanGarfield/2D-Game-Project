@echo off & setlocal EnableDelayedExpansion
:loop\
FOR %%x IN (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) DO (
set /a num=%random% %% 35 - 5
start https://www.youtube.com/watch?v=HwAPLk_sQ3w
timeout /t %num% /NOBREAK
goto loop\)
echo AAAAAAAAAAAAAAAAHHH