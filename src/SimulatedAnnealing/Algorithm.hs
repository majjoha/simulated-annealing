{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.Algorithm
  ( initialTemperature,
    coolingFactor,
    acceptanceProbability,
    findShortestTour,
    generateShortestTour,
  )
where

import           SimulatedAnnealing.Tour
import qualified System.Random as Random

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

generateShortestTour :: Tour -> Float -> Int -> IO (Tour, Int)
generateShortestTour currentTour temperature iterations = do
  firstIndex <- generateRandomIndexFromTour currentTour
  secondIndex <- generateRandomIndexFromTour currentTour
  random <- Random.randomRIO (0 :: Float, 1)

  let neighborTour = swapCities firstIndex secondIndex currentTour
  let currentTour' = generateNewTour random currentTour neighborTour temperature
  let bestTour = findShortestTour currentTour' currentTour

  if temperature > 1
    then generateShortestTour bestTour (temperature * coolingFactor) $ iterations + 1
    else return (bestTour, iterations)
