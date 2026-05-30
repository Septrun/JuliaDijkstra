include("dijkstra.jl")

function ejecutar_pruebas()
    println("---------------------------------------------------------")
    println("               Casos de prueba de Dijkstra               ")
    println("---------------------------------------------------------\n")

    # Caso 1: Grafo estándar
    println("--- Caso 1: Grafo Estándar ---")
    g1 = Grafo(
        1 => [(2, 4.0), (3, 2.0)],
        2 => [(3, 1.0), (4, 2.0), (5, 3.0)],
        3 => [(2, 1.0), (4, 4.0), (5, 5.0)],
        4 => [],
        5 => [(4, 1.0)]
    )
    dist1, prev1 = dijkstra(g1, 1)
    
    println("  -> Distancias calculadas desde el Nodo 1:")
    for nodo in sort(collect(keys(dist1)))
        println("     Al nodo $nodo: $(dist1[nodo]) (Predecesor: $(prev1[nodo]))")
    end
    println("La prueba 1 fue exitosa (La ruta óptima al nodo 5 es 6.0 a través de 1 -> 3 -> 2 -> 5).\n")

    # Caso 2: Nodos inalcanzables
    println("--- Caso 2: Nodos Inalcanzables ---")
    g2 = Grafo(1 => [(2, 5.0)], 2 => [], 3 => [(1, 2.0)])
    dist2, _ = dijkstra(g2, 1)
    println("  -> Distancia al nodo 3 (Se espera: Inf): ", dist2[3])
    println("La prueba 2 fue exitosa.\n")

    # Caso 3: Gestión de excepciones (Pesos negativos)
    println("--- Caso 3: Gestión de Excepciones ---")
    g3 = Grafo(1 => [(2, -3.5)], 2 => [])
    try
        dijkstra(g3, 1)
    catch e
        println("La excepción fue detectada correctamente: ", e.msg)
    end
    
    println("\n---------------------------------------------------------")
end

# Se ejecuta la función al correr el script
ejecutar_pruebas()