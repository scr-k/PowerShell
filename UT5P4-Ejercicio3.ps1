# Cuenta atrás desde Nº indicado

$num = [int](Read-Host "Introduce el Nº para la cuenta atrás: ")

for ($i=$num; $i -ge 0; $i--) {
#              -NoNewline --> Hace que el resultado se muestre en una misma linea
    Write-Host -NoNewline "$i, "
#                           ^--> Muestra los resultados separados por ',' ($i, $i, $,...) 
}