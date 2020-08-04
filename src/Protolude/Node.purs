module Protolude.Node where

import Protolude

import Effect.Class.Console as Console
import Ansi.Codes (Color(..)) as Ansi
import Ansi.Output (foreground, withGraphics) as Ansi
import Node.Process as NodeProcess
import Node.Path as NodePath
import Node.FS.Aff as NodeFS.Aff
import Node.FS.Stats as NodeFS.Stats

filePathExistsAndIsDir :: ∀ m . MonadError Error m => MonadAff m => NodePath.FilePath -> m Boolean
filePathExistsAndIsDir filepath = (try $ liftAff (NodeFS.Aff.stat filepath) <#> NodeFS.Stats.isDirectory) <#> (const false \/ identity)

-- | Exit the script with the given exit code, printing the given message to
-- | standard output if the exit code is 0, and standard error otherwise.
exitWith :: ∀ m a. MonadEffect m => Int -> String -> m a
exitWith code msg = do
  if code == 0
    then Console.log $ Ansi.withGraphics (Ansi.foreground Ansi.BrightGreen) msg
    else Console.error $ Ansi.withGraphics (Ansi.foreground Ansi.BrightRed) msg
  liftEffect $ NodeProcess.exit code
