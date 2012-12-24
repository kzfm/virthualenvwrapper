module Paths_virthualenvwrapper (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/kzfm/Library/Haskell/ghc-7.4.2/lib/virthualenvwrapper-0.1.0.0/bin"
libdir     = "/Users/kzfm/Library/Haskell/ghc-7.4.2/lib/virthualenvwrapper-0.1.0.0/lib"
datadir    = "/Users/kzfm/Library/Haskell/ghc-7.4.2/lib/virthualenvwrapper-0.1.0.0/share"
libexecdir = "/Users/kzfm/Library/Haskell/ghc-7.4.2/lib/virthualenvwrapper-0.1.0.0/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "virthualenvwrapper_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "virthualenvwrapper_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "virthualenvwrapper_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "virthualenvwrapper_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
