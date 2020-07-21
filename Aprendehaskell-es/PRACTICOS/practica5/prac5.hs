--1
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort [a | a <- xs, a < x ] ++ [x] ++ qsort [b | b <- xs, b >= x ]
			 

merge :: [Int] -> [Int] -> [Int]
merge (xs) (ys) = qsort(xs ++ ys) 
 

--2
ordNat :: [Int] -> [Int]
ordNat [] = []
ordNat (x:xs) = ordNat (left) ++ [x] ++ ordNat (right)

 				where
 				left = [a | a <- xs, a < x ]
 				right = [b | b <- xs, b >= x ]


--3
pot :: Int -> Int
pot 0 = 1
pot (x+1) = 2 * pot x 


--4
bin :: Int -> [Int]
bin 0 = []
bin x = bin (x `div` 2) ++ [x `mod` 2] 


--5
binPar :: [Int] -> Bool
binPar [] = False
binPar [x] = x == 0
binPar (x:xs) =  binPar(xs)


--6 EL cuadrado perfecto es la suma de lo n primeros numero simpares
cuad :: Int -> Int -> Bool
cuad 0 _ = True
cuad n x 
			| n < 0 = False
			| n > 0 = cuad (n-x) (x+2)  

cuadPerfc :: Int -> Bool
cuadPerfc n = cuad n 1


--7 ASK

--8
prom :: [Float] -> Float
prom [] = 0
prom (x:xs) = x + prom(xs)

tam :: [Float] -> Int --length
tam [] = 0
tam (x:xs) = 1 + tam(xs)

promedio :: [Float] -> Float
promedio xs = prom xs / fromIntegral(tam xs)


--9




