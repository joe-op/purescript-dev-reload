module DevReload.Data.Mode where

import Prelude
import Data.Maybe (Maybe(..))
import Data.String.Common (toLower)

data Mode
  = Development
  | Production

fromString :: String -> Maybe Mode
fromString = toLower >>> case _ of
  s
    | s == "development" -> Just Development
    | s == "production" -> Just Production
    | otherwise -> Nothing

