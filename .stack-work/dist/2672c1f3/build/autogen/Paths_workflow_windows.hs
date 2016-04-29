module Paths_workflow_windows (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Maria\\haskell\\workflow-windows\\.stack-work\\install\\f1bd8486\\bin"
libdir     = "C:\\Users\\Maria\\haskell\\workflow-windows\\.stack-work\\install\\f1bd8486\\lib\\x86_64-windows-ghc-7.10.3\\workflow-windows-0.0.0-3hOfrHFgpeyI6QXBqUkncU"
datadir    = "C:\\Users\\Maria\\haskell\\workflow-windows\\.stack-work\\install\\f1bd8486\\share\\x86_64-windows-ghc-7.10.3\\workflow-windows-0.0.0"
libexecdir = "C:\\Users\\Maria\\haskell\\workflow-windows\\.stack-work\\install\\f1bd8486\\libexec"
sysconfdir = "C:\\Users\\Maria\\haskell\\workflow-windows\\.stack-work\\install\\f1bd8486\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "workflow_windows_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "workflow_windows_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "workflow_windows_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "workflow_windows_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "workflow_windows_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
