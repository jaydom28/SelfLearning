import GHC.LanguageExtensions (Extension(EmptyCase))
import Data.List              (sortBy, sort)

data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

data BookReview = BookReview BookInfo CustomerID String

data Customer = Customer {customerId :: CustomerID, customerName :: String, customerAddress :: Address}

data PersonType = Person String Int
                  deriving (Show)

myPerson = Person "Justin" 23

getPersonAge :: PersonType -> Int
getPersonAge (Person _ age) = age

myCustomer = Customer 1524 "Justin" ["306 Pine Street"]

type CustomerID = Int
type ReviewBody = String

type BookRecord = (BookInfo, BookReview)

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                    | CashOnDelivery
                    | Invoice CustomerID
                      deriving (Show)

-- file: ch03/AlgebraicVector.hs
-- x and y coordinates or lengths.
data Cartesian2D = Cartesian2D Double Double
                   deriving (Eq, Show)

-- Angle and distance (magnitude).
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)


vectorDistance :: Cartesian2D -> Cartesian2D -> Double
vectorDistance (Cartesian2D x1 y1) (Cartesian2D x2 y2) = sqrt ((y2-y1) + (x2+x1))

isPositive :: Int -> Bool 
isPositive x = x > 0

isNegative :: Int -> Bool 
isNegative x = not (isPositive x)

sumList :: [Int] -> Int
sumList [] = 0
sumList[x] = x 
sumList(x: xs) = x + sumList xs

data MyList a = Cons {listHead :: a, listTail :: MyList a}
              | Nil
              deriving (Show)

sampleList = Cons 1 (Cons 2 (Cons 3 Nil))

toList :: MyList a -> [a]
toList Nil = []
toList list = listHead list : toList (listTail list)

data ATree a =  Node a (Maybe (ATree a)) (Maybe (ATree a))
              deriving (Show)


pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
                  where plural 0 = "No " ++ word ++ "s"
                        plural 1 = "One " ++ word
                        plural x = show x ++ " " ++ word ++ "s"

myLength :: [a] -> Int
myLength [] = 0
myLength (hd:tl) = 1 + (myLength tl)

myMean [] = 0
myMean nums = sum nums / fromIntegral (length nums)

toPalindrome []  = []
toPalindrome (hd:tl) = [hd] ++ toPalindrome tl ++ [hd]

isPalindrome []       = True
isPalindrome [x]      = True
isPalindrome (x:xs)   = (x == last xs) && isPalindrome (init xs)

compareLength list1 list2 = compare (length list1) (length list2)

sortByLength list = sortBy compareLength list