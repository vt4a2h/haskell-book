module Helpers (
    calibrate,
    graduate,
    Color(Red, Green, Blue)
) where

    data Color = Red | Green | Blue
                 deriving Show

    coefficient :: Double
    coefficient = 0.99874

    calibrate = \length -> length * coefficient

    graduate = \length -> length / coefficient