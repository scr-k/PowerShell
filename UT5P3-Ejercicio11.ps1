$edad = [int](Read-Host "Introduce tu edad")

if ($edad -lt 4) {
    Write-Host "Entrada gratis"
}
elseif ($edad -le 18) {
    Write-Host "Precio: 5 euros"
}
else {
    Write-Host "Precio: 10 euros"
}
