module SimulatedAnnealing.Tour
  ( Tour (..),
    calculateDistanceBetweenCities,
  )
where

import           SimulatedAnnealing.City (City)

type Tour = [City]

calculateDistanceBetweenCities :: City -> City -> Float
calculateDistanceBetweenCities (x1, y1) (x2, y2) =
  sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
