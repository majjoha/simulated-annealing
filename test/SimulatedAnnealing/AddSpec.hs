module SimulatedAnnealing.AddSpec (spec) where

import           SimulatedAnnealing
import           Test.Hspec

spec :: Spec
spec = do
  describe "add" $ do
    it "adds two numbers" $ do
      add 1 2 `shouldBe` 3
