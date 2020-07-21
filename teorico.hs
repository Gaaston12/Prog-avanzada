bin :: [Int] -> Bool
bin [x] = x == 0
bin (x:xs) = bin xs

esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

----------------------------------------------------------------
-----NUMEROS NATURALES
----------------------------------------------------------------

data Nat = Zero | Succ Nat --deriving (Show , Eq, Ord)

--definicion para mostrar los nat mas bonitos
--aplicando una funcion cque pasa los nat a enteros
instance Show Nat where
    show = show . toInt
    --Son iguales show n = show(toInt n)

--definicion de igualdad para los numeros naturales
instance Eq Nat where
    Zero == Zero = True
    Zero == (Succ n) = False
    (Succ n) == Zero = False
    (Succ n) == (Succ m) = n == m

--definicion de <= de los naturales  
instance Ord Nat where
    Zero <= _ = True
    Succ n <= Zero = False
    Succ n <= Succ m = n <= m


--Pasa un natural a un entero
toInt :: Nat -> Int
toInt Zero = 0
toInt (Succ n) = 1 + (toInt n)

--ver si un Nat es par
esParNat :: Nat -> Bool
esParNat Zero = True
esParNat (Succ Zero) = False
esParNat (Succ (Succ n)) = esParNat n

--multiplicando nat
multNat :: Nat -> Nat -> Nat
multNat Zero _ = Zero
multNat (Succ n) m = sumaNat m (multNat n m)

--sumando naturales
sumaNat :: Nat -> Nat -> Nat
sumaNat Zero n = n
sumaNat (Succ n) m = Succ (sumaNat n m)

--restando naturales
restaNat :: Nat -> Nat -> Nat
restaNat Zero m = m
restaNat n Zero = n
restaNat (Succ n) m = restaNat n m

-------------------------------------------------------------
--ARBOLES BINARIOS
-------------------------------------------------------------

data BinTree a = Nil | Node (BinTree a) a (BinTree a) deriving (Eq, Show)

size :: BinTree a -> Int
size Nil = 0
size (Node hi r hd) = 1 + size hi + size hd

-------------------------------------------------------------
--TIPOS ENUMERADOS
-------------------------------------------------------------
data Color = Azul | Amarillo | Rosa | Rojo | Celeste | Verde | Blanco deriving (Show, Eq, Ord)

mezclar :: Color -> Color -> Color
mezclar Azul Amarillo = Verde
mezclar Rojo Blanco = Rosa
mezclar Azul Blanco = Celeste

data Boolean = F | V deriving (Show, Eq, Ord) 

andLogico :: Boolean -> Boolean -> Boolean
andLogico F _ = F
andLogico V b = b

orLogico :: Boolean -> Boolean -> Boolean
orLogico F V = V
orLogico V F = V
orLogico V V = V
orLogico F F = F

entoncesLogico :: Boolean -> Boolean -> Boolean
entoncesLogico F V = V
entoncesLogico V F = F
entoncesLogico V V = V
entoncesLogico F F = F