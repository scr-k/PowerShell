# Pide al usuario dos números y muestra la suma, resta, multiplicación y división

$num1 = Read-Host "Introduce el primer numero"
$num2 = Read-Host "Introduce el segundo numero"

$num1 = [int]$num1
$num2 = [int]$num2

Write-Host "Suma: " ($num1 + $num2)
Write-Host "Resta: " ($num1 - $num2)
Write-Host "Multiplicacion: " ($num1 * $num2)
Write-Host "Division: " ($num1 / $num2)
Write-Host "Resto: " ($num1 % $num2)
