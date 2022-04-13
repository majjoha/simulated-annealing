module SimulatedAnnealing.City
  ( City,
    mkCity,
    generateRandomCity,
  )
where

import           System.Random

type City = (Int, Int)

mkCity :: Int -> Int -> City
mkCity x y = (x, y)

generateRandomCity :: IO City
generateRandomCity = do
  x <- randomRIO (10 :: Int, 990)
  y <- randomRIO (10 :: Int, 990)
  return (x, y)
