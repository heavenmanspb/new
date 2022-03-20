set project=new
mkdir %project%
cd %project%
git --version
git init
git remote add origin git@github.com:heavenmanspb/%project%.git
git fetch
git checkout master
@ECHO OFF
:START
set /p choice= "Remove .git from directory (y/n) :"
IF /i '%choice%'=='Y' GOTO REMOVE
IF /i '%choice%'=='N' GOTO INSTALL
ECHO "%choice%" is not valid, try again
ECHO.
goto START
:REMOVE
rmdir /s /q .git
ECHO .git directory deleted.
:INSTALL
npm i
pause