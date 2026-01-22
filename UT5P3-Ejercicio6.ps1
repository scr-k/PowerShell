# Comprobar si es directorio y listar

$directorio = Read-Host "Introduce una ruta: "

if (Test-Path $directorio -PathType Container) {
    Write-Host "Es un directorio. Contenido: "
    Get-ChildItem $directorio -Recurse
}
else {
    Write-Host "$directorio no es una ruta válida"
}