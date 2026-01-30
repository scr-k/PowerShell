# UT6 - Práctica 1 --> Crear estructura AD con script de PowerShell
# Izhar Sedano - 2º ASIR 2025-2026

# Este script debe ejecutarse en 2 fases. Este es el script 2 de 2
# Se debe hacer así ya que hay un reinicio obligatorio después de instalar AD

# ==================================================================================

#####      *****      SCRIPT 2      *****      #####

# !!! SE DEBE EJECUTAR COMO ADMINISTRADOR !!! #

# ==================================================================================

# 2.1. Importar AD y declarar el DC y OU correspondiente
Import-Module ActiveDirectory

Write-Host "--- INICIANDO FASE 2: CREACIÓN DE ESTRUCTURA ---" -ForegroundColor Cyan

$domain = "DC=empresa,DC=local"
$rootOUName = "Empresa"
$rootOUPath = "OU=$rootOUName,$domain"

# ==================================================================================

# 2.2. Importación de los CSV en variables para manejarlas a posterior:
$RutaDepartamentos = "C:\Users\Administrador\Desktop\UT_Practica7_1_Archivos_necesarios\departamentos.csv"
$RutaEmpleados = "C:\Users\Administrador\Desktop\UT_Practica7_1_Archivos_necesarios\empleados.csv"

# ==================================================================================

# 2.3. Creación de la OU Principal 'Empresa'
Write-Host "Creando OU Principal..."
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$rootOUName'")) {
    New-ADOrganizationalUnit -Name $rootOUName -Path $domain
}

# ==================================================================================

# 2.4. Procesar Departamentos (CSV)
$departamentos = Import-Csv -Path $RutaDepartamentos -Delimiter ";"

# Para cada departamento, se ejecuta:
foreach ($dep in $departamentos) {
    $depName = $dep.departamento
    Write-Host "Configurando departamento: $depName"
    
    # Crear OU del departamento
    $ouDepPath = "OU=$depName,$rootOUPath"
    New-ADOrganizationalUnit -Name $depName -Path $rootOUPath -Description $dep.descripcion
    
    # Crear Grupo Global
    New-ADGroup -Name "Grupo_$depName" -GroupCategory Security -GroupScope Global -Path $ouDepPath
}

# ==================================================================================

# 3. Procesar Empleados (CSV)
$empleados = Import-Csv -Path $RutaEmpleados -Delimiter ";"

# Para cada usuario se ejecutará;
foreach ($emp in $empleados) {
      # Formatear Login: nombre.apellido
    $nombreLimpio = $emp.nombre.Replace(" ", "") # Elimina espacios de nombres
    $apellidoLimpio = $emp.apellido.Replace(" ", "") # Elimina espacios de apellidos
    $samAccount = "$($nombreLimpio.ToLower()).$($apellidoLimpio.ToLower())"
    
    $depEmp = $emp.departamento
    $targetOU = "OU=$depEmp,$rootOUPath"
    $pass = ConvertTo-SecureString "aso.2025" -AsPlainText -Force
    
    Write-Host "Creando usuario: $samAccount en $depEmp"
    
    # Crear Usuario
    New-ADUser -Name "$($emp.nombre) $($emp.apellido)" `
        -SamAccountName $samAccount `
        -UserPrincipalName "$samAccount@empresa.local" `
        -GivenName $emp.nombre `
        -Surname $emp.apellido `
        -Path $targetOU `
        -AccountPassword $pass `
        -ChangePasswordAtLogon $true `
        -Enabled $true `
        -ErrorAction SilentlyContinue
        
    # Vincular al Grupo
    Add-ADGroupMember -Identity "Grupo_$depEmp" -Members $samAccount
}

Write-Host "PROCESO COMPLETADO EXITOSAMENTE."
Write-Host ""
Write-Host "Se recomienda volver a reiniciar en caso de ERROR"

# ==================================================================================

# FIN DEL SCRIPT 2

# Después de ejecutar se podrá iniciar sesión en los usuarios creados y cambiar la contraseña

# ==================================================================================
