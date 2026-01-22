$passCorrecta = "R00tR00t!"
$passIntroducida = Read-Host "Introduce tu contraseña: "

if ($passIntroducida.ToLower() -eq $passCorrecta.ToLower()) {
    Write-Host "Contraseña correcta. Permiso concedido"
}
else {
    Write-Host "Contraseña Incorrecta. Vuelve a Intentar"
}