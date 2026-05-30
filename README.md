# Algoritmo de Dijkstra en Julia

Este proyecto contiene una implementación eficiente del Algoritmo de Dijkstra, utilizando el lenguaje de programación Julia. Este programa utiliza una priority queue basada en un Min-Heap binario para optimizar la búsqueda de caminos más cortos desde un único nodo origen en grafos dirigidos con pesos no negativos.


# Estructura del Proyecto

El código se ha diseñado modularmente y se separan las responsabilidades:

*dijkstra.jl*: Contiene la lógica del algoritmo, el tipado del grafo mediante listas de adyacencia y el control de pesos negativos y nodos inexistentes.
*main.jl*: Funciona para realizar las pruebas automatizadas del proyecto. Importa el archivo principal y ejecuta tres casos de prueba distintos (flujos normales, casos borde de aislamiento y gestión de excepciones).


# Configuración del Entorno de Desarrollo

Para ejecutar, editar y depurar este proyecto de forma cómoda, se deben de seguir los siguientes pasos:

*Instalar la extensión de Julia*:

1. En Visual Studio Code ve al menú de extensiones (o presiona Ctrl + Shift + X).
3. Busca "Julia" (la extensión oficial desarrollada por "julialang").
4. Haz clic en "Instalar".


# Instalación de Dependencias

El proyecto requiere el paquete oficial "DataStructures.jl". Para instalarlo ingresa al gestor de paquetes de Julia ("pkg>") mediante los siguientes comandos en la terminal:

```bash
julia
]
add DataStructures
```

Posteriormente se debe de abrir una nueva terminal y ejecutar el programa con:

```bash
julia main.jl
```