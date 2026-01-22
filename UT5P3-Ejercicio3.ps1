$n1 = [int](Read-Host "Introduce un núnero: ")
$n2 = [int](Read-Host "Introduce otro número: ")

if ($n1 -gt $n2) {
    Write-Host "$n1 es mayor que $n2"
}
if ($n1 -lt $n2) {
    Write-Host "$n1 es menor que $n2"
}

# En la siguiente parte debería bastar un "else" sin condición
# Pero de esa manera me salta también el primer "if"

elseif ($n1 -eq $n2) {
    Write-Host "Los números son iguales"
}