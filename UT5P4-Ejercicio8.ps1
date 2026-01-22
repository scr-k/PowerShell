# Triangulo con números

$altura = [int](Read-Host "Altura del triángulo: ")

for ($i = 1; $i -le $altura; $i++) {
    
    $linea = ""
    # El primer número de cada fila es (2 * i - 1)
    # El bucle interior resta 2 en cada paso hasta llegar a 1
    for ($j = (2 * $i - 1); $j -ge 1; $j -= 2) {
        $linea += "$j "
    }
    
    # Mostramos la línea construida
    Write-Host $linea
}