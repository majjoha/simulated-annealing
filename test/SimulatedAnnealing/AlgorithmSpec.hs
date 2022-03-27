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
