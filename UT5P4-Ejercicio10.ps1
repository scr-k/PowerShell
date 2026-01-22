# Menú interactivo: Carpetas, ficheros, nombres, verificación, fehca....

$op = ""

while ($op -ne "x") {

    Write-Host "======= INTERACCIÓN CON EL SISTEMA ======="
    Write-Host ""
    Write-Host "a) Crear carpeta"
    Write-Host "b) Crear fichero"
    Write-Host "c) Renombrar fichero o carpeta"
    Write-Host "d) Borrar fichero o carpeta"
    Write-Host "e) Verificar si existe"
    Write-Host "f) Mostrar contenido de un directorio"
    Write-Host "g) Mostrar fecha y hora"
    Write-Host "x) Salir"
    Write-Host ""

    $op = Read-Host "Elige una opcion"

    if ($op -eq "a") {
        $nombre = Read-Host "Nombre de la carpeta a crear: "
        New-Item -ItemType Directory -Name $nombre
    }

    elseif ($op -eq "b") {
        $nombre = Read-Host "Nombre del fichero a crear: "
        New-Item -ItemType File -Name $nombre
    }

    elseif ($op -eq "c") {
        $ruta = Read-Host "Ruta del fichero o carpeta a renombrar: "
        $nuevoNombre = Read-Host "Nuevo nombre"
        Rename-Item $ruta $nuevoNombre
    }

    elseif ($op -eq "d") {
        $ruta = Read-Host "Ruta a borrar: "
        Remove-Item $ruta -Recurse
    }

    elseif ($op -eq "e") {
        $ruta = Read-Host "Ruta a comprobar: "
        if (Test-Path $ruta) { 
            Write-Host "Existe" 
        }
             
        else {
            Write-Host "No existe" 
        }
    }

    elseif ($op -eq "f") {
        $ruta = Read-Host "Ruta del directorio: "
        Get-ChildItem $ruta
    }

    elseif ($op -eq "g") {
        Get-Date
    }
}
