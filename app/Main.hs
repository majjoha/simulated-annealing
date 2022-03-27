module Main where

import           Control.Monad      (replicateM)
import           SimulatedAnnealing

main :: IO ()
main = do
  initialTour <- replicateM 1000 generateRandomCity
  let initialDistance = totalDistance initialTour

  (result, iterations) <- generateShortestTour initialTour initialTemperature 0
  let finalTourDistance = totalDistance result
  let difference = initialDistance - finalTourDistance

  putStrLn ("Iterations: " ++ show iterations)
  putStrLn ("Initial distance: " ++ show initialDistance)
  putStrLn ("Final tour distance: " ++ show finalTourDistance)
  putStrLn ("Difference: " ++ show difference)
