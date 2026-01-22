# Pregunta al usuario horas trabajadas y coste por hora
# Calcula el salario a pagar

# Para que el número sea entero se puede usar:
$horas = [int](Read-Host "Cuantas horas has trabajado? ")

# O bien declararlo por separado como en la siguiente parte:
$coste = Read-Host "Coste €/h"
$coste = [int]$coste

# Total de coste * horas
$total = $horas * $coste

Write-Host "El trabajador debe cobrar $total €"