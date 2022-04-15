{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Monad      (replicateM, unless, when)
import           Data.Word          (Word8)
import           Foreign.C.Types
import           SDL                (($=))
import qualified SDL
import           SDL.Vect
import           SimulatedAnnealing

screenWidth, screenHeight :: CInt
(screenWidth, screenHeight) = (1000, 1000)

black :: V4 Word8
black = V4 minBound minBound minBound maxBound

white :: V4 Word8
white = V4 maxBound maxBound maxBound maxBound

setupSDL :: IO (SDL.Renderer, SDL.Window)
setupSDL = do
  SDL.initialize [SDL.InitVideo]
  SDL.HintRenderScaleQuality $= SDL.ScaleLinear

  do
    renderQuality <- SDL.get SDL.HintRenderScaleQuality
    when (renderQuality /= SDL.ScaleLinear) $
      putStrLn "Warning: Linear texture filtering not enabled!"

  window <-
    SDL.createWindow
      "Simulated Annealing"
      SDL.defaultWindow {SDL.windowInitialSize = V2 screenWidth screenHeight}
  SDL.showWindow window

  renderer <-
    SDL.createRenderer
      window
      (-1)
      SDL.RendererConfig
        { SDL.rendererType = SDL.AcceleratedRenderer,
          SDL.rendererTargetTexture = False
        }

  return (renderer, window)

main :: IO ()
main = do
  (renderer, window) <- setupSDL

  initialTour <- replicateM 1000 generateRandomCity
  let initialDistance = totalDistance initialTour

  (result, iterations, tourHistory) <-
    generateShortestTour initialTour initialTemperature 0 []
  let finalTourDistance = totalDistance result
  let difference = initialDistance - finalTourDistance

  let loop tours = do
        events <- SDL.pollEvents
        let quit = elem SDL.QuitEvent $ map SDL.eventPayload events

        -- Set the background to white
        SDL.rendererDrawColor renderer $= white
        SDL.clear renderer

        -- Set the drawing color to black
        SDL.rendererDrawColor renderer $= black
        SDL.drawLines renderer $ tourToVector $ safeHead tours
        SDL.present renderer

        if null tours
          then unless quit $ loop tours
          else unless quit $ loop $ safeTail tours
  loop tourHistory

  putStrLn ("Iterations: " ++ show iterations)
  putStrLn ("Initial distance: " ++ show initialDistance)
  putStrLn ("Final tour distance: " ++ show finalTourDistance)
  putStrLn ("Difference: " ++ show difference)

  SDL.destroyRenderer renderer
  SDL.destroyWindow window
  SDL.quit
