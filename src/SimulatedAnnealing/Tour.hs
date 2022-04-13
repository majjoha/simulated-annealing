module SimulatedAnnealing.Tour
  ( Tour,
    calculateDistanceBetweenCities,
    totalDistance,
    swapCities,
    generateRandomIndexFromTour,
    tourToVector,
    safeHead,
    safeTail,
  )
where

import qualified Data.Vector.Storable    as SV
import           Foreign.C.Types
import           SDL
import           SimulatedAnnealing.City (City, mkCity)
import           System.Random

type Tour = [City]

calculateDistanceBetweenCities :: City -> City -> Float
calculateDistanceBetweenCities (x1, y1) (x2, y2) =
  sqrt ((x1' - x2') ^ 2 + (y1' - y2') ^ 2)
    where
      x1' = fromIntegral x1 :: Float
      x2' = fromIntegral x2 :: Float
      y1' = fromIntegral y1 :: Float
      y2' = fromIntegral y2 :: Float

totalDistance :: Tour -> Float
totalDistance [] = 0
totalDistance [(_, _)] = 0
totalDistance [c1, c2] = calculateDistanceBetweenCities c1 c2
totalDistance (c1 : c2 : xs) =
  calculateDistanceBetweenCities c1 c2 + totalDistance (c2 : xs)

generateRandomIndexFromTour :: Tour -> IO Int
generateRandomIndexFromTour tour = randomRIO (0 :: Int, length tour - 1)

swapCities :: Int -> Int -> Tour -> Tour
swapCities = swapCities'
  where
    replace i x xs = take i xs ++ [x] ++ drop (i + 1) xs
    swapCities' i j xs = replace i (xs !! j) $ replace j (xs !! i) xs

tourToVector :: Tour -> SV.Vector (Point V2 CInt)
tourToVector tour =
  SV.fromList $
    map (\(x, y) -> P (V2 (fromIntegral x) (fromIntegral y))) $
      tour ++ [head [head tour]]

safeHead :: [Tour] -> Tour
safeHead []       = [mkCity 0 0]
safeHead (x : xs) = x

safeTail :: [Tour] -> [Tour]
safeTail []       = []
safeTail [x]      = [x]
safeTail (x : xs) = xs
