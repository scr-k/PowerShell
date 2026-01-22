$tipo = Read-Host "Quieres pizza vegetariana? (si/no)"

if ($tipo -eq "si") {
    Write-Host "Ingredientes disponibles: Pimiento, Tofu"
    $ing = Read-Host "Elige un ingrediente"
    Write-Host "Pizza vegetariana con tomate, mozzarella y $ing"
} 

elseif ($tipo -eq "no") {
    Write-Host "Ingredientes disponibles: Peperoni, Jamon, Salmon"
    $ing = Read-Host "Elige un ingrediente"
    Write-Host "Pizza no vegetariana con tomate, mozzarella y $ing"
}

else {
    Write-Host "Opción NO válida. Elige si/no"
}
