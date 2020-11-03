module Protolude.Url (Url, mkUrl, unsafeUrl, unUrl) where

import Protolude

import Data.Generic.Rep.Show (genericShow)
import Data.String.Regex (Regex, test) as Regex
import Unsafe.Coerce (unsafeCoerce)
import UrlRegexSafe

newtype Url = Url String

derive instance urlNewtype :: Newtype Url _
derive instance urlEq :: Eq Url
derive instance urlOrd :: Ord Url
derive instance urlGeneric :: Generic Url _
instance urlShow :: Show Url where show = genericShow

mkUrl :: String -> Maybe Url
mkUrl string =
  if Regex.test (urlRegexSafe $ defaultUrlRegexSafeOptions { exact = true, strict = true }) string
    then Just $ Url string
    else Nothing

unsafeUrl :: String -> Url
unsafeUrl = unsafeCoerce

unUrl :: Url -> String
unUrl = unsafeCoerce
