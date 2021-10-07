data Roygbiv = Red
                | Orange
                | Yellow
                | Green
                | Blue
                | Indigo
                | Violet
                 deriving (Eq, Show)


data PersonRecord = Person { 
                        name    :: String,
                        age     :: Int,
                        height  :: Double
                     }
                     | Account {
                        name    :: String,
                        creation:: Double,
                        friends :: [PersonRecord]
                     }
                     deriving (Show)
