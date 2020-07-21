edad :: (Int, Int, Int)->(Int, Int, Int) -> Int
edad(x,y,z)(a,b,c)
					| (c-z > 0) && (b-y >= 0) && (a-x >= 0) = c-z
					| (c-z > 0) && ((b-y < 0) || (a-x < 0)) = c-z -1
					| (c-z <= 0) = 0