--para iniciar -> ghci en la consola
--para abrir un archivo  :l adentro del ghci


---------------------------------------------------------
------- PRACTICA N1
---------------------------------------------------------



--ejer 1
--((2^29)`mod`(2^9)) == 2^20       -> false

--ejer 2
--head(tail("hola mundo"))         -> 'o'

--ejer 3
--(head.reverse)"hola mundo"      -> 'o'
--el . significa composicion de funciones

--ejer 4
ultimo :: [Int] -> Int
ultimo xs = (head.reverse) xs

esPar :: [Int] -> Bool
esPar xs = (ultimo xs) `mod` 2 == 0

--ejer 5
sumList :: [Int] -> Int
sumList [] = 0
sumList [x] = x
sumList (x:xs) = x + sumList xs

mult3 :: Int -> Bool
mult3 x = x `mod` 3 == 0

--ejer 6
mult6 :: Int -> Bool
mult6 x = x `mod` 6 == 0
--mult6(ultimo[1,2,3,6,12])

--ejer 7
ecuacion :: [Int] -> Bool
ecuacion (x:xs) = 3 * x + 1 == (head.reverse) xs


--ejer 8
producList :: [Int] -> Int
producList [] = 0
producList [x] = x
producList (x:xs) = x * producList(xs)

igual :: Int -> Int -> Bool
igual x y = x == y
--(igual (sumList[1,2,3]) (producList[1,2,3]))

--ejer 9
palindromo :: [Char] -> Bool
palindromo [] = True
palindromo [x] = True
palindromo (x:xs) = reverse(x:xs) == (x:xs)
--palindromo ['n','e','u','q','u','e','n']

--ejer 10
--Main> (head.(drop 3)) "0123456"
-- devuelve '3'
--tipo Char



---------------------------------------------------------
------- PRACTICA N2
---------------------------------------------------------



--ejer 2
hd :: [a] -> a
hd (x:xs) = x

tl :: [a] -> [a]
tl (x:xs) = xs

lst :: [a] -> a
lst [x] = x
lst (x:xs) = lst xs

init2 :: [a] -> [a]
init2 [x] = []
init2 (x:xs) = x : init2 xs

--ejer 3 
--concateno todos los elementos de xs en ys
conc_list :: [a] -> [a] -> [a]
conc_list xs [] = xs
conc_list [] ys = ys
conc_list (x:xs) (y:ys) = x:(conc_list xs (y:ys))

--tomo los n  elementos
--itero recursivamente concatenando n-1 veces x a xs
tomar :: Int -> [a] -> [a] 
tomar n [] = []
tomar 0 _ = [] --_ significa cualquier cosa. Es como un comodin
tomar n (x:xs) = x : (tomar (n-1) xs) 

--itero recursivamente hasta que llegue al caso base n=0
tirar :: Int -> [a] -> [a]
tirar n [] = []
tirar 0 xs = xs
tirar n (x:xs) = tirar (n-1) xs

--inser_fin :: a -> [a] -> [a]
--inser_fin

--ejer 4 calcular el valor absoluto
absoluto :: Int -> Int
absoluto x 
    | x >= 0     = x
    | otherwise = -x

--ejer 5 calcular los anios
edad :: (Int,Int,Int) -> (Int,Int,Int) -> Int
edad (x,y,z) (p,q,r) 
    | (q < y) || (q == y && p < x) = r-z-1
    | r > z = r-z 
    | otherwise = z-r

-- ejer 6 ver si un num es primo o no
-- a_div_b se fija si a es dividible por b
a_div_b :: Int -> Int -> Bool
a_div_b x y = x `mod` y == 0 

-- divisores, muestra una lista de los divisores de un numero dado
divisores :: Int -> [Int]
divisores x = filter (a_div_b x) [1..x]
    
--usando divisores te dice si un numero es primo o no
esPrim :: Int -> Bool
esPrim x
    | divisores x == [1,x] = True
    | otherwise = False

--ejer 7 dado un n ́umero natural n, retorne la lista de todos los n ́umeros naturales primos menores
-- Calcular los factores 
factores :: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]

--filtra los numero no primos menos a n
primosMenores :: Int -> [Int]
primosMenores n = [x | x <- [2..n], esPrim x]

--ejer 8 dada una lista retorne la reversa de esa
listReversa :: [a] -> [a]
listReversa [x] = [x]
listReversa (x:xs) = reverse (x:xs)


--ejer 9 se fija si 2 listan son iguales
iguales :: [Int] -> [Int] -> Bool
iguales [] [] = True
iguales [xs] [] = False
iguales [] [ys] = False
iguales (x:xs) (y:ys) = x == y  && iguales xs ys

{--ejer 10
palindromo :: [Char] -> Bool
palindromo [] = True
palindromo [x] = True
palindromo (x:xs) = reverse(x:xs) == (x:xs)

palindromo ['n','e','u','q','u','e','n']--}



-------------------------------------------------------------------------
-- PRACTICA N3
-------------------------------------------------------------------------



--ejer 1 unir 2 listas ordenadas
merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs)(y:ys)
            |x < y = merge xs (y:ys)
            |otherwise = y : (merge (x:xs) ys)


mergesort :: [Int] -> [Int]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge half1 half2
    where   half1 = mergesort(take sizeHalf xs)
            half2 = mergesort(drop sizeHalf xs)
            sizeHalf = div (length xs) 2


{--
LET en lugar de WHERE
msort :: Ord a => [Int] -> [Int]
msort [] = []
msort [Int] = [Int]
msort xs = merge (msort (firstHalf xs)) (msort (secondHalf xs))

firstHalf xs = let { n = length xs } in take (div n 2) xs
secondHalf xs = let { n = length xs } in drop (div n 2) xs 
--}

{--quicksort
quicksort :: [] -> []

--}
 
--ejer 2 
--Defina una función que, dada una lista de naturales, la ordene.


--ejer 3
--Defina una función que, recursivamente y sólo utilizando adición y multipli-
--cación, calcule, dado un natural n, el número 2 n .



--ejer 4
--Defina una función que, dado un número natural n, retorne su representación
--binaria como secuencia de bits.



--ejer 5
--Defina una función que, dado un número natural n en su representación
--binaria, decida si n es par o no
--binPar :: Int -> Bool
--binaria [x]
--        | x == 0 = True
--        | otherwise = False
--binPar (x:xs) = binPar xs


--ejer 6
--Escriba una función que, dado un número natural, decida si el mismo es un
--cuadrado perfecto o no.
esCuadradoP :: Int -> Bool 
esCuadradoP x = length(divisores x) `mod` 2 /= 0 


--ejer 7 
--Definir la función repetidos de forma tal que dado un elemento z, un enetero
--n y una lista xs; z aparece n veces. Dar dos definiciones, una de ellas con listas
--por comprensión / dado un n y m crea una lista de n numeros m
repeti2 :: Eq a => Int -> a -> [a] -> Bool
repeti2 n y xs = n == length ([x| x <- xs , x == y])

repit :: Int -> a -> [a] 
repit 0 m = []
repit n m = m:repit (n-1) m


--ejer 8
--Definir la funcin nelem tal que nelem xs n es elemento nésimo de xs, em-
--pezando a numerar desde el 0. Por ejemplo,
--nelem [1, 3, 2, 4, 9, 7]3− > 4

nelem :: Int -> [a] -> a 
nelem 0 (x:xs) = x 
nelem n (x:xs) = nelem (n - 1) xs 

--ejer 9
--Redefinir la funcin mı́nimum tal que minimun l es el menor elemento de la lista.
--Dar dos definiciones, una de ellas utilizando funciones de alto orden (foldl1).



-------------------------------------------------------------------------
-- PRACTICA N4
--ORDEN NORMAL -> se reduce siempre la expresion mas afuera y mas a la izq
--OREDEN APLICATIVO -> se reduce siempre la expresion mas adentro y a la izq
------------------------------------------------------------------------------

{--
--Ejer 1
2 * cuadrado.(head[2,4,5,6,7,8])

    a) APLICATIVO
        2 * cuadrado.(head[2,4,5,6,7,8])
        {def head}
        2 * cuadrado (2)
        {def cuadrado}
        2 * (2 * 2)
        {aritmetica}
        2 * 4
        {aritmetica}
        8

    b) NORMAL -> se trabaja varias veces una misma funcion
        2 * cuadrado.(head[2,4,5,6,7,8])
        {def cuadrado}
        2 * (head[2,4,5,6,7,8] * head[2,4,5,6,7,8])
        {def head}
        2 * ( 2 * head[2,4,5,6,7,8])
        {def head}
        2 * (2 * 2)
        {aritmetica}
        2 * 4
        {aritmetica}
        8

    c) EVALUACION LAZY (orden NORMAL)
            -> se crean variables asignando alguna funcion para aplicar sustitucion y no repetir 
        2 * cuadrado.(head[2,4,5,6,7,8])
        {def cuadrado}
        2 * (y * y)
            [[ y = head(2,4,5,6,7,8)]]
        {def head}
        2 * (y * y)
            [y = 2]
        {sustitucion}
        2 * (2 * 2)
        {aritmetica}
        2 * (4)
        {aritmetica}
        8

--Ejer 2
    linf = 1 : linf
    head.linf

    APLICATIVO
    ----------
        head.linf
        ={def linf}
        head.(1:linf)
        ={de linf}
        head.(1:(1:linf))
        ={def linf}
        head.(1:(1:(1:linf)))
        ...
        se aplica linf infinitamente(el pregrama no termina)

    
    NORMAL
    ------
        head.linf
        ={def linf} --porque (head.(x:xs) = x)
        head.(1:linf)
        ={def head}
        1
    

--Ejer 3 
    f.x.0 = x
    f.x.(n+1) = cuadrado.(f.x.n)
    f.2.3

    Ord. NORMAL
    -----------

        f.2.3
        ={def f}
        cuadrado(f.2.2)
        ={def cuadrado}
        (f.2.2) * (f.2.2)
        ={def f}
        cuadrado(f.2.1) * (f.2.2)
        ={def cuadrado}
        ((f.2.1) * (f.2.1)) * (f.2.2)
        ={def f}
        (cuadrado(f.2.0) * (f.2.1)) * (f.2.2)
        ={def cuadrado}
        (((f.2.0)*(f.2.0)) * (f.2.1)) * (f.2.2)
        ={def f}
        ((2*(f.2.0)) * (f.2.1)) * (f.2.2)
        ={def f}
        (2 * 2 * (f.2.1)) * (f.2.2)
        ={aritmetica}
        4 * (f.2.1)) * (f.2.2)
        ={def f}
        4 * cuadrado(f.2.0)) * (f.2.2)
        ={def cuadrado}
        4 * ((f.2.0)*(f.2.0)) * (f.2.2)
        ={def f}
        4 * (2*(f.2.0)) * (f.2.2)
        ={def f}
        4 * (2*2) * (f.2.2)
        ={aritmetica}
        16 * (f.2.2)
        ={def f}
        16 * cuadrado(f.2.1)
        ={def cuadrado}
        16 * ((f.2.1)*(f.2.1))
        ={def f}
        16 * (cuadrado(f.2.0)*(f.2.1))
        ={def cuadrado}
        16 * ((f.2.0)*(f.2.0)*(f.2.1))
        ={def f}
        16 * (2*(f.2.0)*(f.2.1))
        ={def f}
        16 * (2*2)*(f.2.1))
        ={aritmetica}
        16 * (4 * (f.2.1))
        ={def f}
        16 * (4 * cuadrado(f.2.0))
        ={def cuadrado}
        16 * (4 * ((f.2.0)*(f.2.0)))
        ={def f}
        16 * (4 * (2*2))
        ={aritmetica}
        16 * 16
        ={aritmetica}
        256

    EV. LAZY
    --------
        f.2.3
        ={def f}
        cuadrado(f.2.2)
        ={def cuadrado}
        x * x
            [[ x = (f.2.2) ]]
        ={def f}
        x * x
            [[ x = cuadrado(f.2.1) ]]
        ={def cuadrado}
        x * x
            [[ x = y * y,
               y =(f.2.1) ]]
        ={def f}
        x * x
            [[ x = y * y,
               y = cuadrado(f.2.0) ]]
        ={def cuadrado}
        x * x
            [[ x = y * y,
               y = z * z, 
               z =(f.2.0) ]]
        ={def f}
        x * x
            [[ x = y * y,
               y = z * z, 
               z =2 ]]
        ={reemplazo}
        x * x
            [[ x = y * y,
               y = 2 * 2]]
        ={aritmetica}
        x * x
            [[ x = y * y,
               y = 4]]
        ={reemplazo}
        x * x
            [[ x = 4 * 4]]
        ={aritmetica}
        x * x
            [[ x = 16]]
        ={reemplazo}
        16 * 16
        ={aritmetica}
        256

--Ejer4
    

--}


-------------------------------------------------------------------------
-- PRACTICA N5
-------------------------------------------------------------------------


--ejer 1 generar listas infinitas de 1
linf :: [Int]
linf = 1:linf

--ejer 2 lista infinitas de naturales comenzando por x
inf :: Int -> [Int]
inf n = [x | x <- [n..]]

--ejer 3 Generar una lista con los primeros n naturales
primN :: Int -> [Int]
primN x = take x (inf 0) 

--ejer 4 Retornar los primeros 5 elementos de una lista infinita de enteros positivos
primPos :: [Int]
primPos  = take 5 (inf 1) 

--UTILIZANDO FUNCIONES DE ALTO ORDEN
-------------------------------------
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p [] = []
myFilter p (x:xs)
            | p x = x : (myFilter p xs)       
            | otherwise = myFilter p xs 

--ejer 5 Dada una lista de enteros, retornar sus cuadrados
cuad :: Int -> Int
cuad x = x * x

cuadList :: [Int] -> [Int]
cuadList [] = []
cuadList (x:xs) = myMap (cuad) (x:xs)  


--ejer 6 Dado un entero positivo retornar sus divisores
esDiv :: Int -> Int -> Bool
esDiv a b = a `mod` b == 0

divInt :: Int -> [Int]
divInt x = myFilter (esDiv x) [1..x]

--ejer 7 Dada una lista de naturales obtener la lista que contenga solo los números primos de la lista original
listPrim :: [Int] -> [Int]
listPrim (x:xs) = myFilter (esPrim) (x:xs)

--ejer 8 Dada una lista retornar la suma de los cuadrados de la lista.
sumCuad :: [Int] -> Int
sumCuad (x:xs) = foldr (+) 0 (map (cuad) (x:xs))

--ejer 9 Crear una lista con los sucesores de una lista dada
--sucList :: [Int] -> [Int]
--sucList (x:xs) = foldr (:) [] () 


--ejer 10 Dada una lista de enteros, sumar todos sus elementos
mySum :: [Int] -> Int
mySum (x:xs) = foldr (+) 0 (x:xs)

--ejer 11 Definir el factorial usando fold.
myFac :: Int -> Int 
myFac x = foldr (*) 1 [1..x]


--UTILIZANDO LISTAS POR COMPRENSION
-------------------------------------

--ejer 12 Dada una lista retornar sus sucesores.
--succ :: [Int] -> [Int]
--succ = [x | x <- [0..xs], x + 1] 

--ejer 13 Dada una lista retornar sus cuadrados.
--myCuad :: [Int] -> [Int]
--myCuad x = [x | x <- [x:xs], cuad x]

--ejer 14 Dada una lista enteros retornar los elementos pares y que sean mayores a 8.
--listPar :: [Int] -> [Int]
--listPar (x:xs) 
--            | x = [x | x <- [Int], (x `mod` 2 == 0) > 8] : listPar xswine-stable-i386 
--            | otherwise = listPar xs

--ejer 15 Dado un entero retornar sus divisores.
--myDivs :: Int -> [Int]
--myDivs n = [x | x <- [1..n], div]

--ejer 16 Dado un natural n, retornar los números primos comprendidos entre 1 y n.
primos :: Int -> [Int]
primos n = [x | x <- [2..n], esPrim x]

--ejer 17 Dada dos listas retornar su producto cartesiano.


--ejer 18 Definir la lista infinita de los números pares
parInf :: [Int]
parInf = [x | x <- [0..], even x]


--ejer 19 Usando el ejercicio anterior, definir una función que toma los primeros n elementos.
parInf2 :: Int -> [Int]
parInf2 n = [x | x <- [0..n], even x]



-------------------------------------------------------------------------
-- PRACTICA N6
-------------------------------------------------------------------------


--ejer 1 Definir el tipo Nat, visto en el teórico
data Nat = Zero | Succ Nat 

--ejer 2. Definir la función natToInt: Nat -> Int,
-- que dado un número Nat retorna su número entero correspondiente. 
--Por ejemplo: natToInt (Suc(Suc Cero)) = 2
--definicion para mostrar los nat mas bonitos
--aplicando una funcion cque pasa los nat a enteros
instance Show Nat where
    show = show . natToInt
    --Son iguales show n = show(toInt n)

--definicion de igualdad para los numeros naturales
instance Eq Nat where
    Zero == Zero = True
    Zero == (Succ n) = False
    (Succ n) == Zero = False
    (Succ n) == (Succ m) = n == m

    {--instalce Eq Nat where
        n == m = eqNat n m--}

--definicion de <= de los naturales  
instance Ord Nat where
    Zero <= _ = True
    Succ n <= Zero = False
    Succ n <= Succ m = n <= m

natToInt :: Nat -> Int
natToInt Zero = 0
natToInt (Succ n) = 1 + (natToInt n)

--cuando dos Nat son iguales
eqNat :: Nat -> Nat -> Bool
eqNat Zero Zero = True
eqNat Zero (Succ n) = False
eqNat (Succ n) Zero = False
eqNat (Succ n) (Succ m) = eqNat n m

--ejer 3 3. Definir la función intToNat: Int -> Nat,
-- que dado un número entero retorna su Nat correspondiente.
-- Por ejemplo: intToNat 2 = (Suc(Suc Cero))

intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat n = Suc (intToNat (n-1))

--ejer 4  Definir la función sumaNat:
-- Nat -> Nat -> Nat, la cual suma dos números Nat
sumaNat :: Nat -> Nat -> Nat
sumaNat Zero n = n
sumaNat (Succ n) m = Succ (sumaNat n m)


  
--ejer 5 Definir los árboles binarios.
data BinTree a = Nil | Node (BinTree a) a (BinTree a) deriving (Eq, Show)


--Definir las siguientes funciones sobre árboles binarios : size y height
-------------------------------------------------------------------------

--ejer 6 La función size, que dado un árbol devuelve 
--el número de nodos del árbol.
mySize :: BinTree a -> Int
mySize Nil = 0
mySize (Node hi r hd) = 1 + mySize hi + mySize hd

--ejer 7 La función height, que dado un árbol devuelve la 
--altura del mismo.
myHeight :: BinTree a -> Int
myHeight Nil = 0
myHeight (Node hi r hd) = 1 + max (myHeight hi myHeight hd)  



-------------------------------------------------------------------------
-- PRACTICA N8
-------------------------------------------------------------------------

--Ejercicio1. La función nand puede ser definida como p nand q = ¬(p ∧ q), definir esta función en Haskell 
--sin utilizar las funciones ¬ y ∧.

nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True


--Ejercicio 2. La función maj(x, y, z) retorna true ssi al menos dos de sus argumento son true, definirla en Haskell

maj:: Bool-> Bool-> Bool-> Bool
maj True True _ = True
maj True _ True = True
maj _ True True = True
maj _ _ _ = False

{--Ejercicio 3. En Haskell un predicado sobre un tipo A es una función p::A ->Bool,
por ejemplo:
even : : Int −> Bool
even x = ( x mod 2 == 0 )
es un predicado sobre números cuya variable libre es x
Además podemos escribir predicados con varias variables libres, por ejemplo
funciones del estilo: p:: Int ->(a->Bool) pueden interpretarse como predi-
cados sobre el tipo A que tienen una variable libre de tipo entero, un ejemplo
es:
i s E v e n : : Int −> [ Int ] −> Bool
i s E v e n i xs = xs . i mod 2 == 0
es decir, dado un indice y una lista, dice si el elemento en la posición dada es
par o no.
Utilizando estas ideas podemos escribir cuantificadores en Haskell. Por ejem-
plo, el cuantificador universal es una función:
t o d o s : : [ Int ]−>[a]−>(Int −> [ a ] −> Bool)−>Bool”
que toma una lista de indices (el rango), una lista y un predicado y dice si el
predicado se cumple para todos los elementos de la lista que estén en el rango.
Una posible definición es:
todos : :
[ Int ] −> [ a ] −> ( Int −> [ a ] −> Bool)−>Bool
t o d o s i s xs p = f o l d l (&&) t r u e ys
where ys = [ p i xs | i <−i s ]
Utilizar esta función para escribir las siguientes especificaciones en Haskell:• h∀i : 0 ≤ i < #xs : xs.i mod 2 == 0i
• h∀i : 0 ≤ i < #xs ∧ i mod 2 == 1 : xs.i > 0i--}

todos :: [Int] -> [a] -> (Int -> [a] -> Bool)-> Bool
todos is xs p = foldl (&&) True ys
			  where ys = [p i xs | i<- is ]


isEven :: Int -> [Int] -> Bool
isEven i xs = xs!!i `mod` 2 == 0

todospares :: [Int] -> Bool
todospares xs = todos [0..(length xs) - 1] xs isEven

isPos :: (Num a, Ord a) => Int -> [a] -> Bool
isPos i xs = xs!!i > 0

sumatoria :: Num a => [Int] -> [a] -> (Int -> [a] -> a)-> a
sumatoria is xs p = foldl (+) 0 ys
					where ys = [p i xs | i<- is ]

productoria :: Num a => [Int] -> [a] -> (Int -> [a] -> a)-> a
productoria is xs p = foldl (*) 1 ys
			  where ys = [p i xs | i<- is ]

ecua1 :: Num a => Int ->[a]-> a
ecua1 i xs = xs!!i

ecua :: Num a => Int -> [a] -> a
ecua i xs = 2*xs!!i+1

--Ejercicio 4. Utilizando la mismas ideas del ejercicio 3, escribir los cuantificadores de sumatoria, productora y contatoria.

--sumatoria [0,1,2,3,4,5] [2,2,3,4,6,3] ecua1
--Completar funciones que hagan uso de Sumatoria y Productoria

--contatoria is xs p = sumatoria ys xs neutro
-- 				where ys = [i | i<-is, p i xs]
