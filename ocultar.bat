cls
@ECHO OFF
title Protege-Me
::
:: INICIA Variables a configurar
set "folder=Escondeme"
set "passw=Qwerty1"
:: INICIA Variables a configurar
::
:: De aqui en adelante, ¡¡NO EDITAR!!
::
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST %folder% goto MDLOCKER
:CONFIRM
echo Esta Seguro de que quiere proteger la Carpeta(S/N)
set/p "cho=>"
if %cho%==S goto LOCK
if %cho%==s goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Seleccion invalida.
goto CONFIRM
:LOCK
ren %folder% "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo %folder%, carpeta protegida con exito
goto End
:UNLOCK
echo Ingrese su Contraseña para proteger su carpeta
set/p "pass=>"
if NOT %pass%== %passw% goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" %folder%
echo Carpeta desbloqueada con exito
goto End
AIL
echo Contraseña invalida
goto end
:MDLOCKER
md %folder%
echo %folder%, carpeta creada con exito
goto End
:End