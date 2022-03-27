{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.Algorithm
  ( initialTemperature,
    coolingFactor,
    acceptanceProbability,
    findShortestTour,
  )
where

import           SimulatedAnnealing.Tour

initialTemperature :: Float
initialTemperature = 10_000

coolingFactor :: Float
coolingFactor = 0.99995

acceptanceProbability :: Float -> Float -> Float -> Float
acceptanceProbability f1 f2 temperature
  | f2 < f1 = 1
  | otherwise = exp ((f1 - f2) / temperature)

findShortestTour :: Tour -> Tour -> Tour
findShortestTour currentTour bestTour
  | totalDistance currentTour < totalDistance bestTour = currentTour
  | otherwise = bestTour

generateNewTour :: Float -> Tour -> Tour -> Float -> Tour
generateNewTour random currentTour neighborTour temperature =
  if random < acceptanceProbability currentLength neighborLength temperature
  then neighborTour
  else currentTour
    where
      currentLength = totalDistance currentTour
      neighborLength = totalDistance neighborTour
