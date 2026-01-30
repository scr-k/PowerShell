# UT6 - Práctica 1 --> Crear estructura AD con script de PowerShell
# Izhar Sedano - 2º ASIR 2025-2026

# Este script debe ejecutarse en 2 fases. Este es el script 1 de 2
# Se debe hacer así ya que hay un reinicio obligatorio después de instalar AD

# ==================================================================================

#####      *****      SCRIPT 1      *****      #####
# !!! SE DEBE EJECUTAR COMO ADMINISTRADOR !!! #

# ==================================================================================

Write-Host " --- INICIANDO FASE 1: CONFIGURACIÓN DEL EQUIPO Y AD --- " -ForegroundColor Cyan

# ==================================================================================

# 1.1. Cambio de nombre del equipo
Write-Host "Cambiando nombre del equipo a Empresa-DC..."
Rename-Computer -NewName "Empresa-DC" -Force
Write-Host "Nombre cambiado correctamente"

# ==================================================================================

# 1.2. Instalación de Active Directory
Write-Host "Instalando el rol de Active Directory Domain Services..."
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# ==================================================================================

# 1.3. Configuración del Bosque
$domainName = "empresa.local"

#    La contraseña debe ser cifrada para que se pueda aplicar:
$securePass = ConvertTo-SecureString "aso.2025" -AsPlainText -Force

Write-Host "Promocionando a Controlador de Dominio (empresa.local)..."
Import-Module ADDSDeployment
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $domainName `
    -DomainNetbiosName "EMPRESA" `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$true `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true `
    -SafeModeAdministratorPassword $securePass

# ==================================================================================

# 1.4. Aviso para poder reiniciar y aplicar cambios

Write-Host "***************************************************************" -ForegroundColor Red
Write-Host " ATENCIÓN: El equipo DEBE REINICIARSE para aplicar los cambios." -ForegroundColor Red
Write-Host " Tras el reinicio, EJECUTE el script 'UT6P1_Parte2.ps1'." -ForegroundColor Red
Write-Host "***************************************************************" -ForegroundColor Red

Start-Sleep -Seconds 5

# ==================================================================================

# A continuación, el equipo debe reiniciarse.
# Al volver a iniciar sesión, se debe ejecutar el script UT6P1_Parte2.ps1
#     para continuar con la configuración de la estructura y creación de usuarios

# ==================================================================================
# ==================================================================================

#     FIN DEL SCRIPT

# Después del reinicio, debería aparecer el usuario EMPRESA\Administrador al inicar sesión

# ==================================================================================
