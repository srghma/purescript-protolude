{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "protolude"
, dependencies =
  [ "affjax"
  , "console"
  , "effect"
  , "node-fs-aff"
  , "node-process"
  , "node-path"
  , "prelude"
  , "proxy"
  , "psci-support"
  , "record"
  , "typelevel-prelude"
  , "debug"
  , "variant"
  , "ansi"
  , "generics-rep"
  , "url-regex-safe"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
