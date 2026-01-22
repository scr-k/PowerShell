# Juego de adivinar número

$numCorrecto = 47
$intento = 0

while ($numCorrecto -ne $intento) {
    $intento = [int](Read-Host "Prueba Nº del 0 al 100: ")
    
    if ($intento -gt $numCorrecto) {
        Write-Host "Prueba más bajo!"
        Write-Host " "
    }

    elseif ($intento -lt $numCorrecto) {
        Write-Host "Prueba más alto!"
        Write-Host " "
    }

    else {
        Write-Host "Has acertado!"
        Write-Host "El número correcto era: $numCorrecto "
    }
}