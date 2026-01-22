# Reperit nombre de usuario

$nombre = Read-Host "Introduce tu nombre: "
$repeticiones = [int](Read-Host "Repeticiones: ")

for ($i=1; $i -le $repeticiones; $i++) {
    Write-Host $nombre
}