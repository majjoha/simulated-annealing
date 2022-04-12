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

    describe "swapCities" $ do
      it "swaps two cities in a tour" $ do
        let tour = [(1, 2), (1, 3), (3, 1), (2, 2), (2, 3)]
        swapCities 2 4 tour `shouldBe` [(1, 2), (1, 3), (2, 3), (2, 2), (3, 1)]

    describe "segment" $ do
      it "segments a tour of an even number of cities" $ do
        let tour = [(1, 2), (3, 4), (5, 6), (7, 8)]
        segment tour
          `shouldBe` [ ((1, 2), (3, 4)),
                       ((3, 4), (5, 6)),
                       ((5, 6), (7, 8)),
                       ((7, 8), (1, 2))
                     ]

      it "segments a tour of an odd number of cities" $ do
        let tour = [(1, 2), (3, 4), (5, 6)]
        segment tour
          `shouldBe` [ ((1, 2), (3, 4)),
                       ((3, 4), (5, 6)),
                       ((5, 6), (1, 2))
                     ]
