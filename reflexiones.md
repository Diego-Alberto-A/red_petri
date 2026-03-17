# Diego Alberto Antonio Espinosa - A01736064
## Conclusión
Durante esta actividad pude obtener un conocimiento más profundo de Elixir, especialmente al trabajar con estructuras como listas, mapas y conjuntos para modelar el comportamiento de una red de Petri. Implementar las funciones necesarias para simular el disparo de transiciones y verificar cuáles estaban habilitadas me ayudó a entender mejor cómo se pueden representar sistemas concurrentes dentro de un lenguaje funcional. La idea de las redes de Petri me pareció interesante porque permite visualizar y analizar cómo se mueven los estados dentro de un sistema. Sin embargo, en algunos momentos la actividad se volvió un poco complicada debido a ciertas instrucciones que resultaban confusas, lo que hizo necesario dedicar más tiempo a interpretar correctamente lo que se esperaba implementar. A pesar de esto, el ejercicio resultó útil para reforzar conceptos tanto de programación en Elixir como de modelado de sistemas.




# Dylan Isaac Mancilla Lopez - A01739718
## Conclusión
### Análisis de la Función de Ejecución (`fire`)
### A. Representación por Lista de Aristas (`EdgeList`)
En esta versión, la función `fire` es **computacionalmente ineficiente**. 
- **Búsqueda Lineal:** Para obtener $Pre(t)$ y $Post(t)$, el sistema debe filtrar la lista completa de aristas. Si la red tiene $E$ aristas, el costo es $O(E)$.
- **Acoplamiento:** La función depende de una búsqueda externa en cada disparo, lo que ralentiza la evolución de la red en sistemas con alta carga de transiciones.
### B. Representación por Mapa de Adyacencia (`AdjacencyMap`)
Esta versión transforma la ejecución en una **operación de acceso directo**.
- **Acceso Constante:** Al estar los conjuntos $Pre$ y $Post$ pre-calculados como llaves de un mapa, el costo de obtener los nodos necesarios es $O(1)$ (o $O(\log n)$ en la práctica de la BEAM).
- **Claridad Lógica:** El código es más declarativo y menos propenso a errores de filtrado.

La experiencia de programación demuestra que en Elixir, **la inmutabilidad de los datos favorece el uso de Mapas** para representar grafos. Mientras que la lista de aristas es útil para la definición inicial, el Mapa de Adyacencia es la estructura "en memoria" que permite que la Red de Petri escale sin degradar el tiempo de respuesta del sistema.
