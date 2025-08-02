module Main where

import Data.List
import Data.List.Split

import Data.Char

import System.Environment
import System.Exit

wordsAtLine :: String -> [String]
wordsAtLine line = words $ map (\x -> if isAlpha x then x else ' ') line

formatWordCount :: (String, Int) -> String
formatWordCount ls = do
  let (word, count) = ls
  word ++ " => " ++ show count

processBookAt :: FilePath -> IO ()
processBookAt filePath = do
  -- Get the file Name
  let fileName = last $ splitOn "/" filePath
  putStrLn $ "Filename: " ++ fileName

  -- Read the file content
  content <- readFile filePath

  let contentByLine = lines content

  -- Print the content line count
  let contentLineCount = length $ contentByLine
  putStrLn $ "Number of Lines: " ++ show contentLineCount

  let wordList = concat $ map (\x -> wordsAtLine x) contentByLine
  let wordCount = map (\x -> (x !! 0, length x)) $ group $ sort wordList
  putStrLn "Word frequency"
  mapM_ (\x -> putStrLn $ formatWordCount x) wordCount
  

main :: IO ()
main = do
  args <- getArgs

  case args of
    [filePath] -> processBookAt filePath
    _ -> do
      putStrLn "Usage: bookell <filepath>"
      exitFailure
