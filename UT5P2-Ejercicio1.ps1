# Muestra al usuario: 
# Nombre de usuario, directorio de trabajo, dominio al que pertenece y nombre del equipo

$usuario = $env:USERNAME
$directorio = Get-Location
$dominio = $env:USERDOMAIN
$equipo = $env:COMPUTERNAME

Write-Host "Hola $usuario"
Write-Host "Tu directorio de trabajo es $directorio"
Write-Host "Perteneces al dominio $dominio"
Write-Host "Tu equipo se llama $equipo"
