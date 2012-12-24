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
  (venv:_) <- getArgs
  vdir <- getVirthualenvDir
  removeDirectoryRecursive $ vdir </> venv
