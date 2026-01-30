# Script para crear directorios y asignar permisos por medio del CSv proporcionado
# Izhar Sedano - ASO 2026

# ==========================================================
# GESTIÓN DE CARPETAS, PERMISOS NTFS Y SMB
# ==========================================================

Write-Host "--- CONFIGURANDO RECURSOS COMPARTIDOS Y PERMISOS NTFS ---" -ForegroundColor Cyan

# ==========================================================

$dirBase = "C:\Empresa"

# IMPORTANTE: Necesitamos cargar los departamentos si ejecutamos esto por separado
$departamentos = Import-Csv -Path "C:\Users\Administrador\Desktop\UT_Practica7_1_Archivos_necesarios\departamentos.csv" -Delimiter ";"

# 1. Crear carpeta raíz
if (!(Test-Path $dirBase)) { 
    New-Item -Path $dirBase -ItemType Directory 
    Write-Host "Carpeta raíz $dirBase creada."
}

# Para CADA directorio de CADA departamento, se ejecuta lo siguiente
foreach ($dep in $departamentos) {
    # Usamos .departamento porque es el nombre de la columna en el CSV
    $depPath = Join-Path $dirBase $dep.departamento
    
    if (!(Test-Path $depPath)) { 
        New-Item -Path $depPath -ItemType Directory 
        Write-Host "Creando subcarpeta: $depPath"
    }

    # --- Configuración de ACL (NTFS) ---
    $acl = Get-Acl $depPath
    $acl.SetAccessRuleProtection($true, $false) 

    $rules = @()
    $rules += New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $rules += New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del dominio", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
    
    $groupName = "EMPRESA\Grupo_$($dep.departamento)"
    $rules += New-Object System.Security.AccessControl.FileSystemAccessRule($groupName, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")

    $rules | ForEach-Object { $acl.SetAccessRule($_) }
    
    Set-Acl $depPath $acl
    Write-Host "Permisos NTFS aplicados correctamente en: $depPath"
}

# ==========================================================

# 2. Compartición del recurso en red (SMB)
Write-Host "Compartiendo la carpeta Empresa..." -ForegroundColor Yellow
if (!(Get-SmbShare -Name "Empresa")) {
    New-SmbShare -Name "Empresa" -Path $dirBase -FullAccess "Todos" 
}