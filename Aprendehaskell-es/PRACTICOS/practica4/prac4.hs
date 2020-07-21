--1
unos :: Int -> [Int]
unos x = xs where xs = x:xs

--data Unos = [] | xs deriving (show) 	

--2
natu :: Int -> [Int]
natu x = [x..] 

--3
listNat :: Int -> [Int]
listNat x = [1..x]


--4
primNumNat :: Int -> [Int] -> [Int]
primNumNat 0 (x:xs) = []
primNumNat n (x:xs) = x : primNumNat (n-1) xs 


--5
cuad :: Int -> Int
cuad x = x*x

listCuad :: [Int] -> [Int]
listCuad [] = []
listCuad (x:xs) = cuad x : listCuad xs 

--6
esDiv :: Int -> Int -> Bool
esDiv n x=  n `mod` x == 0 

listaDiv :: Int -> [Int]
listaDiv n = [x | x <- [1..n], esDiv n x] 


--7
esPrim :: Int -> Bool
esPrim n = length [x | x <- [1..n], n `mod` x == 0] == 2 

listPrimRecu :: [Int] -> [Int]
listPrimRecu [] = []
listPrimRecu (x:xs) 
					|esPrim x = x : listPrimRecu xs
					|otherwise = listPrimRecu xs 


--8
sumaCuad :: [Int] -> Int
sumaCuad [] = 0
sumaCuad (x:xs) = cuad x + sumaCuad xs 

--9
listSuce :: [Int] -> [Int]
listSuce [] = []
listSuce (x:xs) = x+1 : listSuce xs


--10
sumaList :: [Int] -> Int
sumaList [] = 0
sumaList (x:xs) = x +sumaList xs 


--11
factFold :: Int -> Int
factFold n = foldr (*) 1 [1..n]


--12
listSuceComp :: [Int] -> [Int]
listSuceComp xs = [x + 1 | x <- xs ]


--13
listCuadComp :: [Int] -> [Int]
listCuadComp xs = [cuad x | x <- xs]


--14
esPar :: Int -> Bool
esPar n = n `mod` 2 == 0

paresMayoresOcho :: [Int] -> [Int]
paresMayoresOcho xs = [x | x <- xs, esPar x && x >8]


--15
listaDivComp :: Int -> [Int]
listaDivComp n = [x | x <- [1..n], esDiv n x] 


--16
listPrim :: [Int] -> [Int]
listPrim xs = [x | x <- xs, esPrim x]


--17
prodCart :: [Int] -> [Int] -> [(Int, Int)]
prodCart xs ys = [(x,y)| x <-xs, y <- ys] 


--18
listInfPar :: Int -> [Int]
listInfPar n = [x |  x <- (1..n), esPar x]


--19