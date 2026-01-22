$puntos = [double](Read-Host "Introduce tu puntuacion")

if ($puntos -eq 0.0) {
    $nivel = "Inaceptable"
}
elseif ($puntos -eq 0.4) {
    $nivel = "Aceptable"
}
elseif ($puntos -ge 0.6) {
    $nivel = "Meritorio"
}
else {
    Write-Host "Puntuacion no valida"
    exit
}

$dinero = 2400 * $puntos

Write-Host "Nivel: $nivel"
Write-Host "Cantidad: $dinero €"
