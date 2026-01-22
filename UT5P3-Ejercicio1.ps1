# El usuario para un numero y el programa dice si es par o impar.

$num = [int](Read-Host "Introduce un numero")

if ($num % 2 -eq 0) {
    Write-Host "El numero es par"
} else {
    Write-Host "El numero es impar"
}
