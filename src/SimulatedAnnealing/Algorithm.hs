{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.Algorithm
  ( initialTemperature,
    coolingFactor,
    acceptanceProbability,
  )
where

initialTemperature :: Float
initialTemperature = 10_000

coolingFactor :: Float
coolingFactor = 0.99995

acceptanceProbability :: Float -> Float -> Float -> Float
acceptanceProbability f1 f2 temperature
  | f2 < f1 = 1
  | otherwise = exp ((f1 - f2) / temperature)
