module Protolude.Url (Url, mkUrl, unsafeUrl, unUrl, urlRegex) where

import Protolude

import Data.Generic.Rep.Show (genericShow)
import Data.String.Regex (Regex, test) as Regex
import Unsafe.Coerce (unsafeCoerce)

newtype Url = Url String

derive instance urlNewtype :: Newtype Url _
derive instance urlEq :: Eq Url
derive instance urlOrd :: Ord Url
derive instance urlGeneric :: Generic Url _
instance urlShow :: Show Url where show = genericShow

foreign import urlRegex :: { exact :: Boolean, strict :: Boolean } -> Regex.Regex

mkUrl :: String -> Maybe Url
mkUrl string =
  if Regex.test (urlRegex { exact: true, strict: true }) string
    then Just $ Url string
    else Nothing

unsafeUrl :: String -> Url
unsafeUrl = unsafeCoerce

unUrl :: Url -> String
unUrl = unsafeCoerce
