# Reflexiones: Estructuras de Datos en Redes de Petri

## 1. Análisis de la Función de Ejecución (`fire`)

La regla de disparo de una transición es el núcleo dinámico de la red. Matemáticamente, se define como:

$$M' = (M \setminus Pre(t)) \cup Post(t)$$

Donde $M$ es el marcado actual, $Pre(t)$ son los lugares de entrada y $Post(t)$ los de salida. La implementación varió significativamente según la representación del grafo:

### A. Representación por Lista de Aristas (`EdgeList`)
En esta versión, la función `fire` es **computacionalmente ineficiente**. 
- **Búsqueda Lineal:** Para obtener $Pre(t)$ y $Post(t)$, el sistema debe filtrar la lista completa de aristas. Si la red tiene $E$ aristas, el costo es $O(E)$.
- **Acoplamiento:** La función depende de una búsqueda externa en cada disparo, lo que ralentiza la evolución de la red en sistemas con alta carga de transiciones.

### B. Representación por Mapa de Adyacencia (`AdjacencyMap`)
Esta versión transforma la ejecución en una **operación de acceso directo**.
- **Acceso Constante:** Al estar los conjuntos $Pre$ y $Post$ pre-calculados como llaves de un mapa, el costo de obtener los nodos necesarios es $O(1)$ (o $O(\log n)$ en la práctica de la BEAM).
- **Claridad Lógica:** El código es más declarativo y menos propenso a errores de filtrado.

## 4. Conclusión

La experiencia de programación demuestra que en Elixir, **la inmutabilidad de los datos favorece el uso de Mapas** para representar grafos. Mientras que la lista de aristas es útil para la definición inicial, el Mapa de Adyacencia es la estructura "en memoria" que permite que la Red de Petri escale sin degradar el tiempo de respuesta del sistema.
