# Mostrar años cumplidos desde 1 hasta edad actual

$edad = [int](Read-Host "Introduce tu edad: ")

for ($i=1; $i -le $edad; $i++) {
    Write-Host "Ya has pasado los $i años"
}