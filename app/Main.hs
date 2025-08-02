module Main where

import Data.List.Split

import System.Environment
import System.Exit

processBookAt :: FilePath -> IO ()
processBookAt filePath = do
  -- Get the file Name
  let fileName = last $ splitOn "/" filePath
  putStrLn $ "Filename: " ++ fileName

  -- Read the file content
  content <- readFile filePath

  -- Print the content line count
  let contentLineCount = length $ lines content
  putStrLn $ "Number of Lines: " ++ show contentLineCount


main :: IO ()
main = do
  args <- getArgs

  case args of
    [filePath] -> processBookAt filePath
    _ -> do
      putStrLn "Usage: bookell <filepath>"
      exitFailure
