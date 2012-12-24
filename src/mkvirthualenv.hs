import System.Directory
import System.FilePath
import System.Process
import System.Environment

getVirthualenvDir :: IO FilePath
getVirthualenvDir = do
  home <- getHomeDirectory
  return $ home </> ".virthualenv"

main :: IO ()
main = do
  (newenv:_) <- getArgs
  currentDir <- getCurrentDirectory
  vdir <- getVirthualenvDir
  createDirectoryIfMissing True vdir
  createDirectoryIfMissing True $ vdir </> newenv  
  setCurrentDirectory $ vdir </> newenv
  _ <- system "virthualenv" 
  setCurrentDirectory $ currentDir
  return ()