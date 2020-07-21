
--devuelve 1 si es numero es positivo o -1 su es negativo
sig1 :: Int -> String
sig1 x | x > 0 = "positivo"
       | x == 0 = "cero"
       | x < 0 = "negativo"

sig2 :: Int -> Int
sig2 x = if(x >= 0) then 1 else -1

--facorial
fact :: Int -> Int
fact 0 = 1
fact n = n*fact(n-1)

--contar cuantos elementos tiene la lista
--el primer elemento de la lista lo llama x y al resto de la lista lo llama xs
--count [x] = 1
count :: [Int] -> Int
count [] = 0
count (x:xs) = 1 + count xs

--suma la lista
suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs


--retorna el primer elemento de una lista
--la lista tenga algo
--defino una familia de tipos con una sola variable 

hd :: [a] ->  a 
hd (x:xs) = x

--2b practica 2 toda la lista menos el primero

tl :: [a] -> [a]
tl (x:xs) = xs

--retorna el ultimo elemento de la lista
last1 :: [a] -> a
last1 [x] = x
last1 (x:xs) = last1 xs


--retorna toda la lista menos el ultimo elemento
init1 :: [a] -> [a]
init1 [x] = []
init1 (x:xs) =  x:init1(xs) 


