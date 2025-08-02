module Main where

import System.Environment
import System.Exit

processBookAt :: FilePath -> IO ()
processBookAt filePath = do
  content <- readFile filePath
  let contentLength = length $ lines content
  print contentLength

main :: IO ()
main = do
  args <- getArgs

  case args of
    [filePath] -> processBookAt filePath
    _ -> do
      putStrLn "Usage: bookell <filepath>"
      exitFailure
