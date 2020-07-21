--ejer 1
--Teniendo en cuenta el problema que plantea la guía "Cinco soluciones cinco", 
--completa la segunda solución, la que hace uso de acumuladores. 
--Coloca a continuación la definición factoriales_2

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n - 1)
 
fac_2 :: Int -> [Int]
fac_2 n = reverse (aux(n) 0 [1])
        where aux n m (x:xs) 
                            | n == m = [1] 
                            | otherwise = factorial n : (aux (n-1) 0 [1])


{--ejer 2
Define, utilizando listas por comprensión, 
la función que dado un natural n retorne los números primos comprendidos entre 1 y n. 
Coloca también todas las definiciones que uses para resolver este problema.
--}
divisores :: Int -> [Int]
divisores x = filter (div x) [1..x] 
            where div n m = n `mod` m == 0

esPrim :: Int -> Bool
esPrim x
    | divisores x == [1,x] = True
    | otherwise = False 


primN :: Int -> [Int]
primN n = [x | x <- [1..n], esPrim x] 

--ejer 3
-- Como evalua haskell foldr (:) [] [1..]

--foldr (:) [ ] [1..n]
--  1 : (foldr (:) [ ] [2..n])
--   1: ( 2 : ( foldr (:) [ ] [3..n] ) )

--[]
-- =def foldr
-- [1]
-- =def foldr
-- [1,2]
-- =def foldr
-- [1,2,3]


--ejer 4
-- Como evalua haskell foldl (:) [] [1..]
-- foldl no funciona con listas infinitas


--ejer 5 Dar la lista infinita de los números coprimos. Coloca a continuación la definición coprimosInf.
mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b (a `mod` b)

coprim :: Int -> Int -> Bool
coprim n m = if (mcd n m) == 1 then True else False
                        
coprimosInf :: [(Int, Int)]
coprimosInf = [(x,y) | x <- [1..], y <- [1..], (mcd x y) == 1]

--coprimosInf :: devuelve lista infitna de pares de numeros coprimos ente ellos

{--ejer 6
¿Se puede cambiar el orden de evaluación de Haskell? 
¿Para que podría servir hacerlo? 
Da un ejemplo.

si, se puede cambiar usando $! 
puede mejorar la eficiencia de las funciones
sum n [] = n
sum n (x:xs) = sum (n+x) xs
y con el cambio de ejecucion
sum n [] = n 
sum n (x:xs) = (sum $!(n+x)) xs
--}

{--ejer 7 Define una función que sea estricta en todos sus parámetros.

una funcion es estrita para todos sus parametros
si para cada parametro esta definida

Estricta en todos sus parametros(Rta):
    orLogico :: Boolean -> Boolean -> Boolean
    orLogico V V = V
    orLogico V F = V
    orLogico F V = V
    orLogico F F = F

no estrica en todos sus parametros:
    andLogico :: Boolean -> Boolean -> Boolean
    andLogico F _ = F
    andLogico V b = b
--}