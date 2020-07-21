esPrim :: Int -> Bool
esPrim x	
			| (x == 2) = True 
			| ((x `div` x == 1) && (x `div` 1 == x) && (x `mod` 2 /= 0)) = True
			| ((x `div` x /= 1) || (x `div` 1 /= x) || (x `mod` 2 == 0)) = False





				

