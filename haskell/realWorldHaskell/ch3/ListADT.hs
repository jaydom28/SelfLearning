import Data.List

data List a = Cons a (List a)
            | Nil
              deriving (Show)

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

data OptionalTree a = OptionalNode a (Maybe (OptionalTree a)) (Maybe (OptionalTree a))
                    deriving (Show)

zeroHeightTree = Empty
oneHeightTree = Node 0 Empty Empty
twoHeightTree = Node 0 (Node 0 Empty Empty) Empty
threeHeightTree = Node 0 (Node 0 (Node 0 Empty Empty) Empty) Empty

getHeight :: Tree a -> Int
getHeight Empty                 = 0
getHeight (Node _ Empty Empty)  = 1
getHeight (Node _ left right)   = 1 + (max left_height right_height)
                                where   left_height     = getHeight left
                                        right_height    = getHeight right

data Point2D = Point2D Float Float
                deriving (Show)

data Polar2D = Polar2D {
                    magnitude   :: Float,
                    angle       :: Float
                    }
                deriving (Show)

data Direction = TurnLeft | TurnRight | TurnStraight
                    deriving (Show)

radsToDegrees :: Float -> Float
radsToDegrees rads = (rads * 180) / pi
degreesToRads :: Float -> Float
degreesToRads degrees = (pi/180) * degrees

subVectors :: Point2D -> Point2D -> Point2D
subVectors (Point2D x1 y1) (Point2D x2 y2) = Point2D (x1-x2) (y1-y2)

addVectors :: Point2D -> Point2D -> Point2D
addVectors (Point2D x1 y1) (Point2D x2 y2) = Point2D (x1+x2) (y1+y2)

getMagnitude :: Point2D -> Float
getMagnitude (Point2D x y) = sqrt (x**2.0 + y**2.0)


pointToPolar :: Point2D -> Polar2D
pointToPolar (Point2D x y) = Polar2D magnitude angle
                             where  magnitude   = (sqrt (x ** 2.0 + y ** 2.0))
                                    angle       = atan (y/x)

calculateTurn :: Point2D -> Point2D -> Point2D -> Direction
calculateTurn p1 p2 p3 = case angleDifference of
                            EQ  -> TurnStraight
                            GT  -> TurnLeft
                            LT  -> TurnRight
                         where  angleDifference = compare secondAngle firstAngle
                                firstAngle      = angle (pointToPolar (subVectors p2 p1))
                                secondAngle     = angle (pointToPolar (subVectors p3 p1))

calculateTurns :: [Point2D] -> [Direction]
calculateTurns []               = []
calculateTurns (p1:[])          = []
calculateTurns (p1:p2:[])       = []
calculateTurns (p1:p2:p3:ps)    = [(calculateTurn p1 p2 p3)] ++ (calculateTurns (p2:p3:ps))

vec0 = Point2D 3 6
vec1 = Point2D 3 4
vec2 = Point2D 7 10
vec3 = Point2D 25 13

fstVec = Point2D 0 0
sndVec = Point2D 5 5
trdVec = Point2D 10 10

myPoints = [vec0, vec1, vec2, vec3, fstVec, sndVec, trdVec]

toList :: List a -> [a]
toList (Nil) = []
toList (Cons x rest) = x : (toList rest)

checkInt :: Maybe Int -> Int
checkInt input_integer = case input_integer of
                            Nothing -> 0
                            Just x  -> x

processTime :: Int -> Int
processTime n
    | n < lower_limit   = lower_limit
    | n > upper_limit   = upper_limit
    | otherwise = n
    where   lower_limit = 5
            upper_limit = 45

myDrop :: Int -> [a] -> [a]
myDrop n xs | n <= 0    = xs
myDrop _ []             = []
myDrop n (_:xs)             = myDrop (n-1) xs

myLength :: [a] -> Int
myLength []         = 0
myLength (_:rst)    = 1 + (myLength rst)

myMean :: [Float] -> Float
myMean [] = 0.0
myMean floats = (sum floats) / fromIntegral (length floats)

toPalindrome :: [a] -> [a]
toPalindrome []     = []
toPalindrome (x:xs) = [x] ++ (toPalindrome xs) ++ [x]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome []     = True
isPalindrome [x]    = True
isPalindrome xs     = if first_el == last_el
                      then (isPalindrome middle)
                      else False
                      where first_el    = head xs
                            last_el     = last xs
                            middle      = init (tail xs)

compareStringLength :: String -> String -> Ordering
compareStringLength string1 string2 = compare (length string1) (length string2)

sortByLength :: [String] -> [String]
sortByLength strings = sortBy compareStringLength strings

joinBySep :: a -> [[a]] -> [a]
joinBySep _ []          = []
joinBySep _ [x]         = x
joinBySep sep (x:xs)    = x ++ [sep] ++ (joinBySep sep xs)



