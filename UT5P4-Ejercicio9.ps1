# Contraseña

$passCorrecta = "R00tR00t!"
$entrada = ""

while ($entrada -ne $passCorrecta) {
    $entrada = (Read-Host "Introduce tu Contraseña: ")

    if ($entrada -ne $passCorrecta) {
        Write-Host "Contraseña Incorrecta. Vuelve a Probar."
        Write-Host ""
    }

    else {
        Write-Host "Contraseña Correcta. Acceso Permitido."
    }
}