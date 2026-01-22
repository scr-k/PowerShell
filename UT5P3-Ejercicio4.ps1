# CALCULADORA

Write-Host "======== CALCULADORA ========"
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

Write-Host ""
$opcion = Read-Host "Elige una opción: "
Write-Host ""

$n1 = [int](Read-Host "Primer Nº: ")
$n2 = [int](Read-Host "Segundo Nº: ")

if ($opcion -eq 1) {
    $suma = ($n1 + $n2)
    Write-Host "El resultado de $n1 + $n2 es: $suma"
} 
elseif ($opcion -eq 2) {
    $resta = $n1 - $n2
    Write-Host "El resultado de $n1 - $n2 es: $resta"
} 
elseif ($opcion -eq 3) {
    $multi = $n1 * $n2
    Write-Host "El resultado de $n1 x $n2 es: $multi"
}
elseif ($opcion -eq 4) {
    $division = $n1 / $n2
    Write-Host "El resultado de $n1 / $n2 es: $division"
} 
else {
    Write-Host "Opción NO válida"
}