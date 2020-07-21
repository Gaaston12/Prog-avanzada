--HASKELL: lenguaje de programacion funcional

--succ :DEVUELVE EL NUMERO SIGUIENTE DEL QUE LE PASO
--min  :DEVUELVE EL NUMERO MAS CHICO DE LOS QUE YO PASE ENTRE 2
--max  :DEVUELVE EL NUMERO MAS GRANDE DE LOS QUE YO PASE ENTRE 2


--recibe un X y a ese X le suma 10
sumaDiez x = x + 10

restaDiez x = x - 10

suma1 x = x + 1

-- estructura if en haskell
divi x y = if (x `mod` y) == 0
				then "son divisibles"
				else "no son divisible" 

esMayor x y = if x > y
				then "es mayor"
				else "no es mayor"

suma10 x = if x > 20
			then x + 10
			else x 



--manejo de listas en haskell
--Main> 5 : [1,2,3,4] 
--[1,2,3,4,5]


