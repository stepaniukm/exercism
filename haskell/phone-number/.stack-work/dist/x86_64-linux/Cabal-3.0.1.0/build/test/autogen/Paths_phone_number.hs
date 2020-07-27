{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_phone_number (
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
version = Version [1,6,1,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/bin"
libdir     = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/lib/x86_64-linux-ghc-8.8.3/phone-number-1.6.1.8-6t0PYgzufzS8hSqk56QmJG-test"
dynlibdir  = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/share/x86_64-linux-ghc-8.8.3/phone-number-1.6.1.8"
libexecdir = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/libexec/x86_64-linux-ghc-8.8.3/phone-number-1.6.1.8"
sysconfdir = "/home/mateusz/Projekty/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/bddd7f9be37748fd1c37108c733214fef808d3ec4fc11de2b6ec3ac4d74bb20e/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "phone_number_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "phone_number_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "phone_number_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "phone_number_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "phone_number_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "phone_number_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
