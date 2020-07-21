--TIPOS DE DATOS RECURSIVOS ! PRACTICA 5, 2DA PARTE

--1
data Nat = Cero | Suc Nat deriving (Show)--para mostrar en pantalla
--Suc(Suc(Suc(Cero))) = 3

--2
natToInt :: Nat -> Int 
natToInt Cero = 0
natToInt (Suc x) = 1  + natToInt  x


--3
intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat x = Suc (intToNat (x-1)) 

--4
sumaNat :: Nat -> Nat -> Nat 
sumaNat Cero Cero = Cero
sumaNat (Suc x) Cero = Suc (sumaNat x Cero)
sumaNat Cero (Suc y) = Suc (sumaNat Cero y)
sumaNat (Suc x) (Suc y) = Suc (sumaNat x (Suc y))   

--5
--arboles binarios
data BiTree a = Nil | Nodo (BiTree a) a (BiTree a) deriving(Show, EqNodo) 

--6
sizeTree :: BiTree a -> Int
sizeTree Nil = 0 --es nil
sizeTree (Nodo left a right) = 1 + sizeTree left + sizeTree right -- cuando no tiene la forma de nil

--7
altTree :: BiTree a -> Int
altTree Nil = 0
altTree(Nodo left a right) = 1 + max (altTree left) (altTree right)
