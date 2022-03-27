{-# LANGUAGE NumericUnderscores #-}

module SimulatedAnnealing.AlgorithmSpec (spec) where

import           SimulatedAnnealing
import           Test.Hspec

spec :: Spec
spec = do
  describe "initialTemperature" $ do
    it "returns 10000" $ do
      initialTemperature `shouldBe` 10_000
