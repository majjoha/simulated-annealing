module SimulatedAnnealing.Tour
  ( Tour (..),
    calculateDistanceBetweenCities,
    totalDistance,
  )
where

import           SimulatedAnnealing.City (City)

type Tour = [City]

calculateDistanceBetweenCities :: City -> City -> Float
calculateDistanceBetweenCities (x1, y1) (x2, y2) =
  sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

totalDistance :: Tour -> Float
totalDistance [] = 0
totalDistance [(_, _)] = 0
totalDistance [c1, c2] = calculateDistanceBetweenCities c1 c2
totalDistance (c1 : c2 : xs) =
  calculateDistanceBetweenCities c1 c2 + totalDistance (c2 : xs)
