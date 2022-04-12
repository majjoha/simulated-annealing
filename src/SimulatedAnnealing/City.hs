module SimulatedAnnealing.City
  ( City (..),
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
  x <- randomRIO (1 :: Int, 100)
  y <- randomRIO (1 :: Int, 100)
  return (x, y)
