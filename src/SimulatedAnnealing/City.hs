module SimulatedAnnealing.City
  ( City (..),
    mkCity,
  )
where

type City = (Float, Float)

mkCity :: Float -> Float -> City
mkCity x y = (x, y)
