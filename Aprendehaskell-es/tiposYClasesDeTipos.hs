-- TIPOS Y CLASES DE TIPOS
-- Habíamos dicho que haskell tiene un sistema de tipos estático. Se conoce el tipo 
-- de cada expresión en tiempo de compilación, lo que produce un código más seguro.
-- Decíamos tambien que haskell prosee inferencia de tipos.
-- Ṕara saber qué tipo tiene determinda expresión, lo sabremos gracias al comando :t,
-- el cual seguido de una expresión válida nos dice su tipo.

-- VARIABLES DE TIPO
-- Se representan con una letra minúscula. Representa que puede ser de cualquier tipo.
-- A las funciones que tienen variables de tipo se les llama funciones polimórficas.

-- CLASES DE TIPOS PASO A PASO (1ra PARTE)
-- Las clases de tipos son una especie de interfaz que define algún tipo de comportamiento.
-- Si un tipo es miembro de una clase de tipo, significa que ese tipo soporta e implementa
-- el comportamiento que define la clase de tipos.
-- Lo que se usa para indicar una restricción de clase es el símbolo =>
-- Algunas clases de tipos básicas:

-- Eq: es utilizada por los tipos que soportan comparaciones por igualdad. Los miembros
-- de esta clase implementan las funciones == o /= en algún lugar de su definición.

-- Ord: es para tipos que poseen algún orden.
-- Ord cubre todas las funciones de comparación como >, <, >=, <=. 
-- La función compare toma dos miembros de la clase Ord del mismo tipo y devuelve su orden.
-- Ejemplo: "casa" `compare` "casa" retorna EQ
-- Ejemplo: "casa" `compare` "casamiento" retorna LT
-- El orden está representado por el tipo Ordering, que puede tener tres valores distintos:
-- GT, EQ, LT los cuales representan mayor que, igual que y menor que, respectivamente.

-- Show: los miembros de Show pueden ser representados por cadenas. Todos los tipos que hemos
-- visto excepto las funciones forman parte de Show.
-- La función más utilizada con esta clase de tipo es la función show, que toma un valor
-- que pertenece a la clase Show y lo representa como una cadena de texto.
-- Ejemplo: show 3 retorna "3"
-- Ejemplo: show True retorna "True"

-- Read: es como la clase opuesta a Show. La funcion read (observar que es distinta a Read), 
-- toma una cadena y devuelve un valor del tipo que es miembro de Read.
-- Ejemplo: read "True" || False retorna True
-- Ejemplo: read "8.2" + 3.8 retorna 12.0

