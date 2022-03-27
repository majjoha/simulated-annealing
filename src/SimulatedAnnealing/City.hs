module SimulatedAnnealing.City
  ( City (..),
    mkCity,
    generateRandomCity,
  )
where

import           System.Random

type City = (Float, Float)

mkCity :: Float -> Float -> City
mkCity x y = (x, y)

generateRandomCity :: IO City
generateRandomCity = do
  x <- randomRIO (1 :: Float, 100)
  y <- randomRIO (1 :: Float, 100)
  return (x, y)
