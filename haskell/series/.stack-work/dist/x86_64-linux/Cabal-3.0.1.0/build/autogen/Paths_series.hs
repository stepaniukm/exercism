{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_series (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/bin"
libdir     = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/lib/x86_64-linux-ghc-8.8.3/series-1.0.0.4-DbCYbE8y22jCYhWToNnKv1"
dynlibdir  = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/share/x86_64-linux-ghc-8.8.3/series-1.0.0.4"
libexecdir = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/libexec/x86_64-linux-ghc-8.8.3/series-1.0.0.4"
sysconfdir = "/home/mateusz/Projekty/exercism/haskell/series/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "series_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "series_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "series_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "series_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "series_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "series_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
