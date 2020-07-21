--muestro la cantidad de k de elementos
tomar :: [a] -> Int -> [a]
tomar xs 0 = []
tomar (x:xs) k = x : tomar xs (k-1)

--agregar al final
addLast :: [a] -> a -> [a]
addLast [] z = [z]
addLast (x:xs) z = x : addLast xs z

--concatenar 2 listas
concatenar :: [a] -> [a] -> [a]
concatenar [] ys = ys
concatenar (x:xs) ys = x : concatenar xs ys

--muestro los elementos menos los k
tirar :: [a] -> Int -> [a]
tirar xs 0 = [xs]
tirar (x:xs) k = 





