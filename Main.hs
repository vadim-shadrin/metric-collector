{-# LANGUAGE OverloadedStrings #-}
import System.Environment (getEnv)
import Data.Aeson (Value)
import Data.String()
import qualified Data.ByteString.Char8 as S8
import qualified Data.Yaml as Yaml
--import Text.Printf(printf)
import Network.HTTP.Simple
    ( getResponseBody,
      getResponseHeader,
      getResponseStatusCode,
      httpJSON,
      parseRequest
       )

main :: IO ()

main = do
    etcd_url <- getEnv "ETCD_URL"
    print  etcd_url
    initReq <- parseRequest (etcd_url ++ "/keys/message")
    response <- httpJSON initReq
    putStrLn $ "The status code was: " ++ show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    S8.putStrLn $ Yaml.encode (getResponseBody response :: Value)
