# Mostrar impares desde 1 hasta Nº indicado

$numero = [int](Read-Host "Introduce Nº final: ")

for ($i=1; $i -le $numero; $i++) {
    if ($i % 2 -ne 0) {
        Write-Host $i
    }
}