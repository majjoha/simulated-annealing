{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.Algorithm
  ( initialTemperature,
    coolingFactor,
  )
where

initialTemperature :: Float
initialTemperature = 10_000

coolingFactor :: Float
coolingFactor = 0.99995
