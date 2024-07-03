{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

module PandocFilterNbsp (replaceFilter) where

import Data.Text
import Text.Pandoc

replaceFilter :: Block -> IO Block
replaceFilter cb@(CodeBlock attrs contents) = return (CodeBlock attrs (replaceSpaceWithNBSP contents))
replaceFilter rb@(RawBlock format contents) = return (RawBlock format (replaceSpaceWithNBSP contents))
replaceFilter x = return x

-- Replace all instances of SPACE (U+0020) with NO-BREAK SPACE (U+00A0)
replaceSpaceWithNBSP :: Text -> Text
--                              ┌──────────SPACE (U+0020)
--                              │   ┌──────NO-BREAK SPACE (U+00A0)
replaceSpaceWithNBSP = replace " " " "
