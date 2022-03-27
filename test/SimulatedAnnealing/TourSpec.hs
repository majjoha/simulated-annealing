module SimulatedAnnealing.TourSpec (spec) where

import           SimulatedAnnealing
import           Test.Hspec

spec :: Spec
spec = do
  describe "calculateDistanceBetweenCities" $ do
    it "returns the distance between two cities" $ do
      calculateDistanceBetweenCities (150, 250) (200, 300) `shouldBe` 70.71068
