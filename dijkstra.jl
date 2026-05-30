using DataStructures

# Definición del tipo para el Grafo
const Grafo = Dict{Int, Vector{Tuple{Int, Float64}}}

"""
Se calcula el camino más corto desde un nodo origen usando un Min-Heap.
"""
function dijkstra(grafo::Grafo, origen::Int)
    if isempty(grafo)
        error("Hubo un error: El grafo está completamente vacío.")
    end

    # Se extraen todos los nodos únicos
    todos_los_nodos = Set{Int}()
    for (u, vecinos) in grafo
        push!(todos_los_nodos, u)
        for (v, _) in vecinos
            push!(todos_los_nodos, v)
        end
    end

    if !(origen in todos_los_nodos)
        error("Hubo un error: El nodo origen ($origen) no existe en el grafo.")
    end

    distancias = Dict{Int, Float64}()
    previos = Dict{Int, Union{Nothing, Int}}()
    
    for nodo in todos_los_nodos
        distancias[nodo] = Inf
        previos[nodo] = nothing
    end
    
    distancias[origen] = 0.0
    pq = PriorityQueue{Int, Float64}()
    pq[origen] = 0.0

    while !isempty(pq)
        (u, dist_u) = dequeue_pair!(pq)

        if !haskey(grafo, u)
            continue
        end

        for (vecino, peso) in grafo[u]
            if peso < 0
                error("Hubo un error: El algoritmo de Dijkstra no soporta pesos negativos ($peso).")
            end

            nueva_dist = dist_u + peso
            if nueva_dist < distancias[vecino]
                distancias[vecino] = nueva_dist
                previos[vecino] = u
                pq[vecino] = nueva_dist
            end
        end
    end

    return distancias, previos
end