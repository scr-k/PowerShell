# Calculadora mediante funciones

$op = ""

function SUMA {
    $n1 + $n2
}
function RESTA {
    $n1 - $n2
}
function MULTIPLICA {
    $n1 * $n2
}
function DIVIDE {
    $n1 / $n2
}

While ($op -ne 5) {
    Write-Host ""
    Write-Host "****** CALCULADORA ********"
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"
    Write-Host ""
    $op = [int](Read-Host "Introduce una opción (1-5): ")
    Write-Host ""


    if ($op -eq 1) {
        $n1 = [int](Read-Host "Valor de N1: ")
        $n2 = [int](Read-Host "Valor de N2: ")

        Write-Host "La suma de los números es: $(SUMA)"
    }

    elseif ($op -eq 2) {
        $n1 = [int](Read-Host "Valor de N1: ")
        $n2 = [int](Read-Host "Valor de N2: ")

        Write-Host "La resta de los números es: $(RESTA)"
    }

    elseif ($op -eq 3) {
        $n1 = [int](Read-Host "Valor de N1: ")
        $n2 = [int](Read-Host "Valor de N2: ")

        Write-Host "La multiplicación de los números es: $(MULTIPLICA)"
    }

    elseif ($op -eq 4) {
        $n1 = [int](Read-Host "Valor de N1: ")
        $n2 = [int](Read-Host "Valor de N2: ")

        Write-Host "La división de los números es: $(DIVIDE)"
    }

    elseif ($op -eq 5) {
        Write-Host "Saliendo..."
        break 1
    }

    else {
        Write-Host "Opción NO válida. Introduce 1 a 5"
    }
}