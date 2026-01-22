$nombre = Read-Host "Introduce tu nombre "
$sexo = Read-Host "Introduce tu sexo (M/F) "

$inicial = $nombre.Substring(0,1).ToUpper()

if (($sexo -eq "F" -and $inicial -lt "M") -or ($sexo -eq "M" -and $inicial -gt "N")) {
    Write-Host "Perteneces al grupo A"
} else {
    Write-Host "Perteneces al grupo B"
}
