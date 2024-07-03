module Main where

import qualified PandocFilterNbsp (replaceFilter)
import Text.Pandoc.JSON

main :: IO ()
main = do
  toJSONFilter PandocFilterNbsp.replaceFilter
