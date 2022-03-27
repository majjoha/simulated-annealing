{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.AlgorithmSpec (spec) where

import           SimulatedAnnealing
import           Test.Hspec

spec :: Spec
spec = do
  describe "initialTemperature" $ do
    it "returns 10000" $ do
      initialTemperature `shouldBe` 10_000

  describe "coolingFactor" $ do
    it "returns 0.99995" $ do
      coolingFactor `shouldBe` 0.99995

  describe "acceptanceProbability" $ do
    it "returns 1 if the neighbor tour is shorter than the current tour" $ do
      acceptanceProbability 2 1 0 `shouldBe` 1

    it "calculates the acceptance probability if the current tour is longer than the neighbor tour" $ do
      acceptanceProbability 2 4 6 `shouldBe` 0.7165313

  describe "findShortestTour" $ do
    it "returns the shortest tour" $
      do
        findShortestTour
          [ (1, 2),
            (2, 3)
          ]
          [ (1, 2),
            (3, 2),
            (4, 3),
            (5, 1)
          ]
        `shouldBe` [(1, 2), (2, 3)]

    describe "generateNewTour" $ do
      it "generates a new tour based on a random value" $ do
        pending
