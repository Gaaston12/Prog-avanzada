-- Las primeras pequeñas funciones
-- El nombre de las fucniones empiezan con minúsculas. Sí o sí

doubleMe::Int->Int
doubleMe x = x +x

doubleUs::Int->Int->Int
doubleUs x y = x*2 + y*2

-- Obsevar que se puede hacer uso del caracter ' para el nombre de las funciones
doubleUs'::Int->Int->Int
doubleUs' x y = doubleMe x + doubleMe y

-- Si es mayor que 100 entonces lo retorna, sino, retorna su doble
doubleSmallNumber::Int->Int
doubleSmallNumber x = if x>100 
						then x
						else x*2
--Funciones como constantes
conanO'Brien = "Soy yo, Conan 0'Brien!"

--Una introducción a las listas

-- Es una de las estructuras de datos más importantes en Haskell. Son homegeneas.
-- Una cadena es una lista de caracteres. 
cadena = "hello"

cadena' = ['h','e','l','l','o']

-- Las listas se concatenan con el operador ++. Éste toma como parámetros 2 listas.
concatenacion = [1,2,3] ++ [4,5]

-- Otro operador común para concatenar es :. Lo que hace es concatenar un elemnto
-- con una lista. Siempre el elemento tiene que estar a la izquierda.

concatenacion' = 'U':"n gato negro"

-- [1,2,3] es una alternativa sintáctica de 1:2:3:[]
lista123 = [1,2,3]

lista123' = 1:2:3:[]

-- Si queremos obtener un elemento de la lista sabiendo su ídice, utilizamos !!. 
-- Los índices empiezan por 0

ejemploIndice = "Steve Buscemi" !! 6

-- Las listas también pueden contener listas
-- Las listas dentro de las listas pueden tener distintos tamaños pero no pueden
-- ser de tipos diferentes
listaDeLista = [[1,2],[3,4],[5,6,7]]

-- Algunas funciones básicas que pueden operar con listas

-- head: toma una lista y devuelve su cabeza (primer elemento)
-- Ejemplo: head [1,2,3] retorna 1

-- tail: toma una lista y devuelve su cola. (le corta la cabeza) 
-- Ejemplo: tail [1,2,3] retorna [2,3]

-- last: toma una lista y devuelve su último elemento
-- Ejemplo: last [1,2,3] retorna 3

-- init: toma una lista y devuelve toda la lista ecxepto el último elemento
-- Ejemplo: init [1,2,3] retorna [1,2]

-- length: toma una lista y devuelve su tamaño
-- Ejemplo: length [1,2,3] retorna 3

-- mull: comprueva si una lista está vacía
-- Ejemplo: null [] retorna True

-- reverse: pone del revés una lista
-- Ejemplo: reverse [1,2,3] retorna [3,2,1]

-- take: Toma un número y una lista y extrae dicho número de elementos de la lista
-- Ejemplo: take 3 [1,2,3,4,5] retorna [1,2,3]
-- Ejemplo: take 5 [1,2] retorna [1,2]
-- Ejemplo: take 0 [6,6,6] retorna []

-- drop: toma un número y una lista y quita dicha número de elementos 
-- al comienzo de la lsita
-- Ejemplo: drop [5,4,3,2,1] retorna [3,2,1]
-- Ejemplo: drop 0 [1,2] retorna [1,2]
-- Ejemplo: drop 100 [1,2,3,4] retorna []

-- maximum: toma una lista de cosas que pueden tener algún orden 
-- y retorna el elemento más grande

-- minimum: devuelve el más pequeñp
-- Ejemplo: minimum [2,3,1,5,2] retorna 1

-- sum: toma una lista de números y devuelve su suma
-- Ejemplo: sum [1,2,3] retorna 6

-- product: toma una lista de números y devuelve su producto
-- Ejemplo: product [1,2,3] retorna 6

-- elem: toma una cosa y una lista de cosas y nos dice si dicha cosa es un
-- elemento de la lista. Normalmente es llamada de forma infija
-- Ejemplo: 4 `elem` [1,2,3,4] retorna True	

-- RANGOS
-- ¿Qué pasa si queremos una lista con todos los números entre el 1 y el 200?
-- Pues podemos escribirlos mediante un rango, así [1..200]. Colocar eso 
-- en hugs o gchi y observar qué es lo que retorna

-- También podemos especificar el número de pasos entre elementos de un rago.
-- Ejemplo: [2,4..20] retorna todos los pares del 1 hasta el 20
-- Ejemplo: [20,19..1] retorna la lista desde el 20 hasta el 1. Observar que 
-- sí o sí tiene que ir el 19.

-- Es aconcejable no utilizar listas con números flotantes.
-- Se pueden crear listas infinitas
-- Ejemplo: [1..] crea una lista infinita de números naturales desde el 1

-- FUNCIONES QUE CREAN LISTAS INFINITAS
-- cycle: toma una listaa y crea un ciclo de listas iguales infinito. 
-- Ejemplo: cycle [1,2] va a crear una lista infinita [1,2,1,2,1,..]

-- repeat: toma un elemento y crea una lista infinita que contiene ese único
-- elemento
-- Ejemplo: repeat 5 retorna la lista [5,5,5,5,..]

-- replicate: toma un número (n) y un elemento y retorna la lista con 
-- este elemento repetido n veces
-- Ejemplo: replicate 3 10 retorna [10,10,10]


-- LISTAS INTENSIONALES
ejemploListaIntensional = [x*2 | x <- [1..10]]

-- A la lista anterior se le puede añadir una condición (o predicado):
ejemploListaIntensional' = [x*2 | x <- [1..10], x*2>=12]

-- Ejemplo: Lista de todos los números del 50 al 100 cuyo resto al dividirlo
-- por 7 es 3
listaNmod7Igual3 = [x | x <- [50..100], x `mod` 7 == 3]

-- A lo anterior hecho se le suele llamar FILTRADO MEDIANTE PREDICADOS

-- Ejemplo: Queremos una lista intensional que reemplace cada número impar mayor
-- que diez por "BANG!" y cada número impar menor que diez por "BOOM!". Si un 
-- número no es impar, lo dejamos afuera de la lista.

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 
 
-- Ejemplo: Lista de elementos del 10 al 20 que no sean 13, 15 ni 19.

listaSinNros = [x | x<- [10..20], x/=13, x/=15, x/=19]

--En una lista intencional, tambipen podemos extraer elementos de varias listas. 
-- Cuando extraemos elementos de varias listas, se producen todas las combinaciones
-- posibles de dichas listas y se unen según la función de salida que suministremos.
-- Ejemplo: 
variasListas = [x*y | x <- [2,5,10], y <- [8,10,11]]
-- Y si ahora queremos todoslos posibles productos cuyo valor sea mayor que 50?
variasListas' = [x*y | x <- [2,5,10], y <- [8,10,11], x*y>50]

-- Una lista intensional que combine una lista de adjetivos con una lista de nombres.

nombresXAdjetivos = [x ++" "++ y | x<-["rana","cebra","cabra"], y <- ["perezosa","enfadada","intrigante"]]

-- Ejemplo: Escribamos nuestra propia versión de length
length' xs = sum [1 | _ <- xs]
-- _ significa que no nos importa lo que vayamos a extraer de la lsita, así que en 
-- vez de escribir el nombre de una variable que nunca usaríamos, simplemente escribimos _.
-- La función reemplaza cada elemento de la lista original por 1 luego los suma.

-- Ejemplo: Una funcion que toma cadenas y elemina de ellas doto excepto las letras
-- mayúsculas
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
-- probar con "noMEGUSTANLASRANAS"

-- Es posible crear listas intensionales anidadas si estamos trabajando con listas
-- que contienen lsitas. Por ejemplo, dada una lista de números, vamos a eleminar
-- los números impares sin aplanar la lista:

eliminarNumerosEnListas = [ [x | x <- xs, even x] | xs <- xss]
							where xss = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
-- En esta función se hizo uso del where, que lo veremos más adelante detalladamente.
-- Simplemente se aclara que es lo que es xss en este caso. Sino no compilaría el programa.

--TUPLAS
-- Son similares a las listas. 
-- Son utilizadas cuando sabes exactamente cuántos valores tienen que ser convinados.
-- Su tipo depende de cuántos componenetes tenga y del tipo de estos componentes.
-- No tienen que ser homogéneas necesariamente.

-- Funciones sobre tuplas

-- fst: toma una dupla y devuelve su primer componente
-- snd: toma una dupla y devuelve su segundo componente
-- zip: Toma dos listas y las une en una lista uniendo sus elementos en una dupla.
-- Ejemplo: zip [1,2] [5,5] retorna [(1,5),(2,5)]
-- Ejemplo: zip [5,3,2,6,2] ["soy","una","tortuga"] retorna [(5,"soy"),(3,"una"),(2,"tortuga")]

-- Ejemplo de problema de cálculo de trángulos. 
-- ¿Qué triángulo cuyos lados miden enteros  menores que 10 tienen un perímetro igual a 24?
-- Primero vamos a generar todos los trángulos con lados menores o iguales a 10:

triangules = [(a,b,c) | c <-[1..10], b <- [1..10], a <- [1..10] ]
 -- Ahora debemos añadir una condición más, que nos filtre ángulos rectos:
rigthTriangules  = [(a,b,c) | c <-[1..10], b <- [1..10], a <- [1..10], a^2 + b^2 == c^2 ]

-- Ahora solo queda filtrar aquellos cuyos perímetros sean igual a 24
rigthTriangules' = [(a,b,c) | c <-[1..10], b <- [1..10], a <- [1..10], a^2 + b^2 == c^2, a+b+c == 24  ]




