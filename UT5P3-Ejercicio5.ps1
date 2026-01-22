# Comprobar si existe ruta o carpeta

$ruta = Read-Host "Introduce directorio o archivo: "

if (Test-Path $ruta) {
    Write-Host "Existe!"
}
else {
    Write-Host "NO existe"
}