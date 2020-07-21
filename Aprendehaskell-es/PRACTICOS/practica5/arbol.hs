data Arbol a = H a | N a(Arbol a)(Arbol a) deriving (Show)

preOrden :: Arbol a -> [a] 
preOrden (H x) = [x]
preOrden (N x ai ad) = x :(preOrden ai ++ preOrden ad)

posOrden :: Arbol a -> [a]
posOrden (H x) = [x]
posOrden (N x ai ad) = posOrden(ai) ++ posOrden(ad) ++ [x]

inOrden :: Arbol a -> [a]
inOrden (H x) = [x]
inOrden (N x ai ad) = (inOrden(ai) ++ [x]) ++ inOrden(ad)

cambiar :: Arbol a -> a -> [a]
{-
cambiar (H x) i = [i]-}
cambiar (N x ai _) i = posOrden (N x ai i)
