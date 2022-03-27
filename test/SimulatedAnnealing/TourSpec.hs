module SimulatedAnnealing.TourSpec (spec) where

import           SimulatedAnnealing
import           Test.Hspec

spec :: Spec
spec = do
  describe "calculateDistanceBetweenCities" $ do
    it "returns the distance between two cities" $ do
      calculateDistanceBetweenCities (150, 250) (200, 300) `shouldBe` 70.71068

  describe "totalDistance" $ do
    it "returns 0 when the tour is empty" $ do
      totalDistance [] `shouldBe` 0

    it "returns 0 when the tour only has one city" $ do
      totalDistance [(1, 2)] `shouldBe` 0

    it "calculates the distance when the tour has two cities or more" $ do
      totalDistance [(1, 2), (1, 3), (3, 1), (2, 2), (2, 3)]
        `shouldBe` 6.2426405
