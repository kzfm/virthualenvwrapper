import System.Directory
import System.FilePath
import Control.Monad

getVirthualenvDir :: IO FilePath
getVirthualenvDir = do
  home <- getHomeDirectory
  return $ home </> ".virthualenv"

main :: IO ()
main = do
  vdir <- getVirthualenvDir
  venvname <- liftM (filter (`notElem` [".", ".."])) $ getDirectoryContents vdir
  mapM_ putStrLn venvname