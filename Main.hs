import Network.Wreq
main :: IO ()
main = do
   --putStrLn $ "Hello World"
   r <- get "api.skylove.su/v1/users/likes_photos"
