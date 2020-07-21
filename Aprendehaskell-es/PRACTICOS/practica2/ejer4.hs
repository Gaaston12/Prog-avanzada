--valor absoluto
abs1 :: Int -> Int
abs1 x | x >= 0 = x
	   | x < 0 = -x

abs2 :: Int -> Int
abs2 x = if x >= 0 then x else (-x)