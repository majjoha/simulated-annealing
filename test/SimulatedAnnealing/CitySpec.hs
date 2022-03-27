module SimulatedAnnealing.CitySpec (spec) where

import SimulatedAnnealing
import Test.Hspec

spec :: Spec
spec = do
  describe "mkCity" $ do
    it "creates a new `City`" $ do
      mkCity 3 2 `shouldBe` (3, 2)
