{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "web-speech-test-app"
, dependencies =
  [ "aff"
  , "console"
  , "effect"
  , "either"
  , "maybe"
  , "prelude"
  , "psci-support"
  , "random"
  , "react-basic"
  , "react-basic-dom"
  , "react-basic-hooks"
  , "tuples"
  , "web-speech"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
