doubleMe x = x + x

doubleUs x y = (doubleMe x) + (doubleMe y)

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

sum_of :: (Num a) => [a] -> a
sum_of [] = 0
sum_of (x:xs) = x + sum_of xs

new_head :: [a] -> a
new_head [] = error "list is empty"
new_head (hd:_) = hd

new_tail :: [a] -> [a]
new_tail [] = error "list is empty"
new_tail (_:rest) = rest

new_last :: [a] -> a
new_last [] = error "list is empty"
new_last ([x]) = x
new_last (x: xs) = new_last xs

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

myNums = [10, 15, 405, 3, 102]
myChars = "Hello world how are you?"

addVectors :: (Floating a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)

vectorMagnitude :: (Double, Double) -> Double
vectorMagnitude (x, y) = sqrt (x**2 + y**2)

processTime :: Int -> Int
processTime time
    | time < 5 = 5
    | time > 45 = 45
    | otherwise = time

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

max' a b = if a < b then b else a


