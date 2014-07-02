simple_sum :: Int -> Int
simple_sum value = value + value

indicate :: String -> String
indicate address
    | address == "127.0.0.1" = "localhost"
    | null address = "empty IP-address"
    | otherwise = address

prepare_length :: Double -> Double
prepare_length line = 
    line * coefficient
    where coefficient = 0.4959

prepare_length_let :: Double -> Double
prepare_length_let line = 
    let coefficient = 12.4959
        correction = 0.0012
    in
    line * coefficient - correction

main = putStrLn (show ((\x -> x*x) 5))