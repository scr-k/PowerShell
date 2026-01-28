# con 'foreach' leer datos de usuarios.csv e imprimir datos

# !! CAMBIAR RUTA AL DIRECTORIO DONDE ESTÉ EL .CSV !!
$DATOS = Import-Csv C:\Users\Izhar\Downloads\usuarios.csv -Delimiter ","

foreach ($persona in $DATOS) {
    Write-Host "Nombre: $($persona.nombre), Apellidos: $($persona.apellidos), Pertenece a grupo: $($persona.grupo)"
}